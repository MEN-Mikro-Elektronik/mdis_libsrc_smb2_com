/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *         \file  smb2_fch.c
 *      \project  SMB2 library
 *
 *       Author  dieter.pfeuffer@men.de
 *        $Date: $
 *    $Revision: $
 *
 *      \brief  FCH SMB controller support
 *
 *     Required: -
 *     \switches: MAC_IO_MAPPED
 *
 *-------------------------------[ History ]---------------------------------
 *
 * $Log: smb2_fch.c,v $
 *---------------------------------------------------------------------------
  *  (c) Copyright 2016 by MEN Mikro Elektronik GmbH, Nuremberg, Germany
 ******************************************************************************/
/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <MEN/men_typs.h>
#include <MEN/oss.h>
#include <MEN/dbg.h>
#include <MEN/maccess.h>
#include <MEN/mdis_err.h>

#define SMB_COMPILE
#include <MEN/smb2.h>

/*-----------------------------------------+
|  TYPEDEFS                                |
+------------------------------------------*/
/** structure for SMB_HANDLE */
typedef struct
{
	SMB_ENTRIES entries; 		/**< function entries */
	SMB_COM_HANDLE smbComHdl; 	/**< Common handle entries */

	u_int32    ownSize;			/**< size of memory allocated for this handle */
	MACCESS    baseAddr;		/**< base address of smb */
}SMB_HANDLE;

/*-----------------------------------------+
|  DEFINES & CONST                         |
+------------------------------------------*/

/* SMBus I/O Register Address Map */
#define SMB_HST_STS                 0x00 /* host status
                                          * register SMB_HST_STS (default: 0x00) */
#define SMB_HST_CNT                 0x02 /* host control
                                          * register SMB_HST_CNT (default: 0x00) */
#define SMB_HST_CMD                 0x03 /* host command
                                          * register SMB_HST_CMD (default: 0x00)
                                          * host status command register bit 0..7 */
#define SMB_XMIT_SLVA               0x04 /* transmitt slave address
                                          * register SMB_XMIT_SLVA (default: 0x00)
                                          * transmitt slave register bit 7..1 address, bit 0 0=write, 1=read */
#define SMB_HST_D0                  0x05 /* host data 0
                                          * register SMB_HST_D0 (default: 0x00)
                                          * host data0 register for block write commands */
#define SMB_HST_D1                  0x06 /* host data 1
                                          * register SMB_HST_D1 (default: 0x00)
                                          * host data1 register for, used during execution of any command */
#define SMB_HOST_BLOCK_DB           0x07 /* host block data byte
                                          * register SMB_HOST_BLOCK_DB (default: 0x00)
                                          * host block data byte register */
#define SMB_PEC                     0x08 /* packet error check
                                          * register SMB_PEC (default: 0x00)
                                          * packet error check register */
#define SMB_RCV_SLVA                0x09 /* receive slave address
                                          * register SMB_RCV_SLVA (default: 0x44)
                                          * receive slave address register bit 6..0 = slave address */
#define SMB_SLV_DATA_0              0x0A /* receive slave data 0
                                          * register SMB_SLV_DATA_0 (default: 0x00)
                                          * receive slave data0 register */
#define SMB_SLV_DATA_1              0x0B /* receive slave data 1
                                          * register SMB_SLV_DATA_1 (default: 0x00)
                                          * receive slave data1 register */
#define SMB_AUX_STS                 0x0C /* auxiliary status
                                          * register SMB_AUX_STS (default: 0x00) */
#define SMB_AUX_CTL                 0x0D /* auxiliary control
                                          * register SMB_AUX_CTL (default: 0x00) */
#define SMB_SMLINK_PIN_CTL          0x0E /* SMLink pin control
                                          * register SMB_SMLINK_PIN_CTL (default: 0x04) */
#define SMB_SMBUS_PIN_CTL           0x0F /* SMBus pin control
                                          * register SMB_SMBUS_PIN_CTL (default: 0x00) */
#define SMB_SLV_STS                 0x10 /* slave status
                                          * register SMB_SLV_STS (default: 0x00) */
#define SMB_SLV_CMD                 0x11 /* slave command
                                          * register SMB_SLV_CMD (default: 0x00) */
#define SMB_NOTIFY_DADDR            0x14 /* notify device address
                                          * register SMB_NOTIFY_DADDR (default: 0x00)
                                          *  notify device address register bit 7..1 device address */
#define SMB_NOTIFY_DLOW             0x16 /* notify data low byte
                                          * register SMB_NOTIFY_DLOW (default: 0x00)
                                          *   notify data low byte register */
#define SMB_NOTIFY_DHIGH            0x17 /* notify data high byte
                                          * register SMB_NOTIFY_DHIGH   (default: 0x00)
                                          * notify data high byte register */

/* register SMB_HST_STS (default: 0x00) */
#define HOST_BUSY                  0x01
#define INTR                       0x02
#define DEV_ERR                    0x04
#define BUS_ERR                    0x08
#define FAILED                     0x10
#define SMBALERT_STS               0x20
#define INUSE_STS                  0x40
#define BYTE_DONE_STATUS           0x80

/*#define SMB_CLEAR_STATUS           (INTR+DEV_ERR+BUS_ERR+FAILED)*/
#define SMB_CLEAR_STATUS           (0xFF) /* clear all */

/* register SMB_HST_CNT (default: 0x00) */
#define INTREN                     0x01
#define KILL                       0x02
#define QUICK                      (0x00)
#define BYTE                       (0x01 << 2)
#define BYTE_DATA                  (0x02 << 2)
#define WORD_DATA                  (0x03 << 2)
#define PROCESS_CALL               (0x04 << 2)
#define BLOCK                      (0x05 << 2)
#define I2C_READ                   (0x06 << 2)
#define BLOCK_PROCESS              (0x07 << 2)
#define LAST_BYTE                  0x30
#define START                      0x40
#define PEC_EN                     0x80

/* register SMB_AUX_STS (default: 0x00) */
#define CRC_ERROR                   0x01
#define SMBUS_TCO_MODE              0x02

/* register SMB_AUX_CTL (default: 0x00) */
#define AUTO_APPEND_CRC             0x01
#define EN_32BYTE_BUFFER            0x02

/* register SMB_SMLINK_PIN_CTL (default: 0x04) */
#define SMLINK0_CUR_STS             0x01
#define SMLINK1_CUR_STS             0x02
#define SMLINK_CLK_CTL              0x04

/* register SMB_SMBUS_PIN_CTL (default: 0x00) */
#define SMBCLK_CUR_STS              0x01
#define SMBDATA_CUR_STS             0x02
#define SMBCLK_CTL                  0x04

/* register SMB_SLV_STS (default: 0x00) */
#define HOST_NOTIFY_STS             0x01

/* register SMB_SLV_CMD (default: 0x00) */
#define HOST_NOTIFY_INTREN          0x01
#define HOST_NOTIFY_WKEN            0x02
#define SMBALERT_DIS                0x04
/* end of SMBus I/O Register Address Map */

#define WAIT_BUSY_TIME              500
#define WRITE_ENABLE                0x00
#define READ_ENABLE                 0x01

#define	DBG_MYLEVEL		smbHdl->smbComHdl.dbgLevel
#define	DBH				smbHdl->smbComHdl.dbgHdl

/*-----------------------------------------+
|  GLOBALS                                 |
+------------------------------------------*/
/*-----------------------------------------+
|  STATICS                                 |
+------------------------------------------*/
DBGCMD(	static const char errorStartStr[] =	"*** ERROR - ";	)
DBGCMD(	static const char errorLineStr[]  =	" (line	";		)
DBGCMD(	static const char errorEndStr[]	  =	")***\n";		)

/*-----------------------------------------+
|  PROTOTYPES                              |
+------------------------------------------*/

static char * LocSmbIdent( void );
static int32 LocWaitBusyReady( SMB_HANDLE *smbHdl, u_int32 flags );
static int32 LocSmbExit( SMB_HANDLE  **smbHdlP );
static int32 LocSmbXfer( SMB_HANDLE *smbHdl, u_int32 flags, u_int16 addr,
						 u_int8 read_write, u_int8 cmdAddr,
						 u_int8 size, u_int8 *dataP );

/*******************************  LocSmbIdent  *******************************
 *
 *  Description:  Returns the identification string of the module.
 *
 *---------------------------------------------------------------------------
 *  Input......:  -
 *
 *  Output.....:  identification string
 *
 *  Globals....:  -
 ****************************************************************************/
static char *LocSmbIdent( void )
{
    return( "FCH SMB - SMB2 library: $Id: smb2_fch.c,v 1.1 2016/04/06 12:00:00 dpfeuffer Exp $" );
}/*LocSmbIdent*/

/*******************************  LocWaitBusyReady  *************************/
/** Waits to BUSY first and then leaving BUSY and bus idle.
 *				  Returns imediatly if DEV_ERR detected.
 *
 * \param   smbHdl     valid SMB handle
 * \param   flags      flags indicating RX/TX mode (10-bit addr, PEC, ...)
 *
 * \return    smb error
 *
 ****************************************************************************/
static int32 LocWaitBusyReady( SMB_HANDLE *smbHdl, u_int32 flags )
{
    u_int32 i=0;
    u_int8 status=0;
	int32 result = SMB_ERR_NO;
	void* baseAddr = (void*)smbHdl->baseAddr;
	DBGCMD(static const char functionName[] = "SMB2_FCH - LocWaitBusyReady:"; )

	DBGWRT_1((DBH, "%s: smbHdl=%08p\n", functionName, smbHdl));


	/* Make sure the SMBus host is ready to start transmitting */

	if ((status = MREAD_D8(baseAddr, SMB_HST_STS)) != 0x00) {

		DBGWRT_4((DBH, " SMBus busy (%02x). Resetting...\n", status));
		MWRITE_D8(smbHdl->baseAddr, SMB_HST_STS, status);

		if ((status = MREAD_D8(baseAddr, SMB_HST_STS)) != 0x00) {
			DBGWRT_ERR((DBH, "*** %s: Failed! (%02x)\n", functionName, status));
			return(SMB_ERR_BUSY);
		}
		else {
			DBGWRT_4((DBH, "Successful!\n"));
		}
	}

	/* start the transaction by setting bit 6 */
	MSETMASK_D8(baseAddr, SMB_HST_CNT, START);

	/* We will always wait for a fraction of a second! (See PIIX4 docs errata) */
	// OSS_Delay(smbHdl->smbComHdl.osHdl, 2); /* Extra delay for SERVERWORKS_CSB5 */
	OSS_Delay(smbHdl->smbComHdl.osHdl, 1);

	while( (++i < WAIT_BUSY_TIME) &&
		   ((status = MREAD_D8(baseAddr, SMB_HST_STS)) & HOST_BUSY) )
		OSS_Delay(smbHdl->smbComHdl.osHdl, 1);

	/* If the SMBus is still busy, we give up */
	if (i == WAIT_BUSY_TIME) {
		DBGWRT_ERR((DBH, "*** %s: SMBus Timeout!\n", functionName));
		result = SMB_ERR_BUSY;
	}

	if (status & FAILED) {
		result = SMB_ERR_GENERAL;
		DBGWRT_ERR((DBH, "*** %s: Error: Failed bus transaction\n", functionName));
	}

	if (status & BUS_ERR) {
		result = SMB_ERR_COLL;
		DBGWRT_ERR((DBH, "*** %s: Bus collision! SMBus may be "
			"locked until next hard reset. (sorry!)\n", functionName));
		/* Clock stops and slave is stuck in mid-transmission */
	}

	if (status & DEV_ERR) {

		/* Parity Error Correction enabled ? */
		if (flags & SMB_FLAG_PEC)
		{
			/* check for PEC error (and clear it) */
			if (MREAD_D8(baseAddr, SMB_AUX_STS) & CRC_ERROR)
			{
				MWRITE_D8(baseAddr, SMB_AUX_STS, CRC_ERROR);
				DBGWRT_ERR((DBH, "*** %s: PEC error\n", functionName));
				return(SMB_ERR_PEC);
			}
		}
		DBGWRT_ERR((DBH, "*** %s: Error: no response!\n", functionName));
		result = SMB_ERR_ADDR;
	}

	if ((status = MREAD_D8(baseAddr, SMB_HST_STS)) != 0x00)
		MWRITE_D8(smbHdl->baseAddr, SMB_HST_STS, status);

	if ((status = MREAD_D8(baseAddr, SMB_HST_STS)) != 0x00){
		DBGWRT_ERR((DBH, "*** %s: Failed reset at end of "
			"transaction (%02x)\n", functionName, status));
	}

	return result;

}/* LocWaitBusyReady */

/*******************************  LocSmbExit  *******************************/
/** Deinitializes this library and SMB controller.
 *
 * \param smbHdlP	\INOUT  pointer to variable where the handle is stored,
 *                          set to 0
 * \return    always 0
 *
 ****************************************************************************/
static int32 LocSmbExit
(
	SMB_HANDLE **smbHdlP
)
{
	int32 error  = 0;
	SMB_HANDLE  *smbHdl;

	DBGCMD(static const char functionName[] = "SMB2_FCH - LocSmbExit:"; )

	smbHdl = *smbHdlP;
	*smbHdlP = NULL;

	DBGWRT_1((DBH, "%s: smbHdl=%08p\n", functionName, smbHdl));

	/* deinitialize common interface */
	if(smbHdl->smbComHdl.ExitCom)
	{
	    smbHdl->smbComHdl.ExitCom(smbHdl);
    }

	/* clear status first */
	MWRITE_D8(smbHdl->baseAddr,SMB_HST_STS, SMB_CLEAR_STATUS);

    OSS_MemFree( smbHdl->smbComHdl.osHdl, smbHdl, smbHdl->ownSize );
    smbHdl = NULL;

	return( error );
}/* LocSmbExit */

/******************************** LocSmbXfer ********************************/
/** Read/Write data from a device using the SMBus protocol
 *
 *  \param   smbHdl     valid SMB handle
 *	\param   addr       device address
 *	\param   flags      flags indicating RX/TX mode (10-bit addr, PEC, ...)
 *	\param   read_write flag indicating read(=1) or write (=0) access
 *	\param   cmdAdr     data to be sent in command field
 *	\param   size       size of data access (Quick/Byte/Word/Block/(Blk-)Proc
 *	\param   data       pointer to variable with Tx data and for Rx data
 *
 *  \return    0 | error code
 *
 *  Globals....:  -
 ****************************************************************************/
static int32 LocSmbXfer
(
    SMB_HANDLE *smbHdl,
	u_int32 flags,
	u_int16 addr,
	u_int8 read_write,
	u_int8 cmdAddr,
	u_int8 size,
	u_int8 *dataP
)
{
	u_int8  status = 0;
	u_int8 len = 0;
	u_int32 error = SMB_ERR_NO, i;
	u_int16 *wDataP = (u_int16*)dataP;
	DBGCMD(	static const char functionName[] = "SMB2_FCH - LocSmbXfer:"; )

	if(	addr & READ_ENABLE )
    {
    	return( SMB_ERR_ADDR );
    }

    DBGWRT_1( (DBH, "%s: smbHdl=%08p\n", functionName, smbHdl) );

	/* check for PEC error (and clear it) */
	if( MREAD_D8(smbHdl->baseAddr, SMB_AUX_STS) & CRC_ERROR )
	{
		MWRITE_D8(smbHdl->baseAddr, SMB_AUX_STS, CRC_ERROR);
	}

	/* clear and check status first */
	MWRITE_D8(smbHdl->baseAddr,SMB_HST_STS, SMB_CLEAR_STATUS);
	status = MREAD_D8(smbHdl->baseAddr, SMB_HST_STS);

	if( !(status & BYTE_DONE_STATUS) ||
    	 (status & (DEV_ERR | BUS_ERR | HOST_BUSY)) )
	{
		MWRITE_D8(smbHdl->baseAddr,SMB_HST_STS, SMB_CLEAR_STATUS);
	    status = MREAD_D8(smbHdl->baseAddr, SMB_HST_STS);
	}

    MWRITE_D8(smbHdl->baseAddr, SMB_XMIT_SLVA, addr | read_write);//dpok

	switch(size)
	{
		case SMB_ACC_QUICK:
		    DBGWRT_2( (DBH, " SMB_ACC_QUICK\n") );
			size = QUICK;

			/* PEC for quick command not possible */
			if( flags & SMB_FLAG_PEC )
				flags = flags & ~SMB_FLAG_PEC;

			break;

		case SMB_ACC_BYTE:
		    if( read_write == SMB_WRITE )
            {
                MWRITE_D8(smbHdl->baseAddr, SMB_HST_CMD, cmdAddr);
            }
		    size = BYTE;
		    break;

		case SMB_ACC_BYTE_DATA:
		    DBGWRT_2( (DBH, " SMB_ACC_BYTE_DATA\n") );
		    MWRITE_D8(smbHdl->baseAddr, SMB_HST_CMD, cmdAddr);

		   	if( read_write == SMB_WRITE )
            {
                MWRITE_D8(smbHdl->baseAddr, SMB_HST_D0, *dataP);
            }

		   	size = BYTE_DATA;
			break;

		case SMB_ACC_WORD_DATA:
		    DBGWRT_2( (DBH, " SMB_ACC_WORD_DATA\n") );
		    MWRITE_D8(smbHdl->baseAddr, SMB_HST_CMD, cmdAddr);

            if( read_write == SMB_WRITE )
            {
                MWRITE_D8(smbHdl->baseAddr, SMB_HST_D0, *dataP);
				MWRITE_D8(smbHdl->baseAddr, SMB_HST_D1, *(dataP+1));
            }

            size = WORD_DATA;
			break;

		case SMB_ACC_BLOCK_DATA:
			DBGWRT_2( (DBH, " SMB_ACC_BLOCK_DATA cmd: 0x%02x len: 0x%02x\n",
							cmdAddr, dataP[0] ) );
		    MWRITE_D8(smbHdl->baseAddr, SMB_HST_CMD, cmdAddr);

			if (read_write == SMB_WRITE) {

				len = dataP[0];
				if (len > SMB_BLOCK_MAX_BYTES) {
					len = SMB_BLOCK_MAX_BYTES;
					dataP[0] = len;
				}

				/* Data Register 0 contains length of transfer */
				MWRITE_D8(smbHdl->baseAddr, SMB_HST_D0, len);

				/* reset block register buffer pointer */
				MREAD_D8(smbHdl->baseAddr, SMB_HST_CNT);

				/* write the up to 32 byte to block Data Register */
				for (i = 1; i <= len; i++)
					MWRITE_D8(smbHdl->baseAddr, SMB_HOST_BLOCK_DB, dataP[i]);
			}

			size = BLOCK;
			break;

		default:
			error = SMB_ERR_NOT_SUPPORTED;
			goto ERR_EXIT;
	}

	/* Parity Error Correction demanded? */
    if( flags & SMB_FLAG_PEC ){
		/* enable automatic CRC apposition */
		MSETMASK_D8(smbHdl->baseAddr, SMB_AUX_CTL, AUTO_APPEND_CRC);
	    DBGWRT_2( (DBH, " set AUTO_APPEND_CRC for PEC\n") );
    }
	else{
		/* disable automatic CRC apposition */
		MCLRMASK_D8(smbHdl->baseAddr, SMB_AUX_CTL, AUTO_APPEND_CRC);
	}

	//dp size += START;
	MWRITE_D8(smbHdl->baseAddr, SMB_HST_CNT, size);

	//MWRITE_D8(smbHdl->baseAddr,SMB_HST_STS, (char)SMB_CLEAR_STATUS);

	if( (error = LocWaitBusyReady( smbHdl, flags ) ))
	{
	    goto ERR_EXIT;
	}

	/* initialize and perform a read opereation */
	//size &= ~START;

	if(	read_write == SMB_READ )
    {
	    switch( size )
	    {
	        case BYTE:
	        case BYTE_DATA:
	            *dataP = MREAD_D8(smbHdl->baseAddr, SMB_HST_D0);
	            DBGWRT_3( (DBH, " BYTE(_DATA) data=%04x\n", *dataP) );
	            break;

	        case WORD_DATA:
	            *wDataP = MREAD_D8(smbHdl->baseAddr, SMB_HST_D0) +
                         (MREAD_D8(smbHdl->baseAddr, SMB_HST_D1) << 8);
                DBGWRT_3( (DBH, " WORD_DATA data=%04x\n", *wDataP) );
	            break;

		case BLOCK:
			/* get length of block */
			len = MREAD_D8(smbHdl->baseAddr, SMB_HST_D0);
			if( len > SMB_BLOCK_MAX_BYTES )
				len = SMB_BLOCK_MAX_BYTES;
			dataP[0] = len;

			/* reset block register buffer pointer */
			MREAD_D8(smbHdl->baseAddr, SMB_HST_CNT);

			/* get the data */
			for (i = 1; i <= len; i++) {
				dataP[i] = MREAD_D8(smbHdl->baseAddr, SMB_HOST_BLOCK_DB);
				DBGWRT_3( (DBH, " BLOCK_DATA len=%d, i=%d, data=%02x\n",
					 	   len, i, dataP[i]) );
			}

			break;

	        default:
	            error = SMB_ERR_NOT_SUPPORTED;
			    goto ERR_EXIT;
	            break;
	    }
    }

ERR_EXIT:
    return( error );
}/* LocSmbXfer */

/***************************** SMB_FCH_Init *********************************/
/** Initializes this library and check's the SMB host.
 *
 * \param  descP    \IN  descriptor
 * \param  osHdl    \IN  OS specific handle
 * \param  smbHdlP  \IN  pointer to variable where the handle will be stored
 *
 *  \return    0 | error code
 *
 ****************************************************************************/
#ifdef MAC_IO_MAPPED
    u_int32 SMB_FCH_IO_Init
 #else
    u_int32 SMB_FCH_Init
 #endif
 ( SMB_DESC_FCH	*descP, OSS_HANDLE		*osHdl, void			**smbHdlP )
 {
    u_int32     error  = 0;
    SMB_HANDLE  *smbHdl = NULL;
    u_int32		gotSize = 0;
#ifdef MAC_IO_MAPPED
	DBGCMD(	static const char functionName[] = "SMB2 - SMB_FCH_IO_Init:"; )
#else
    DBGCMD(	static const char functionName[] = "SMB2 - SMB_FCH_Init:"; )
#endif

	smbHdl   = (SMB_HANDLE*) OSS_MemGet( osHdl, sizeof(SMB_HANDLE), &gotSize );
	if( smbHdl == NULL )
	{
	    error = SMB_ERR_NO_MEM;
		goto CLEANUP;
	}/*if*/

	*smbHdlP = smbHdl;

	/* init the structure */
	OSS_MemFill( osHdl, gotSize, (char*)smbHdl, 0 ); /* zero memory */

   	smbHdl->smbComHdl.osHdl = osHdl;

	DBGINIT(( NULL, &smbHdl->smbComHdl.dbgHdl ));

	smbHdl->smbComHdl.dbgLevel		= descP->dbgLevel;
	smbHdl->smbComHdl.alertPollFreq = descP->alertPollFreq;

    DBGWRT_1( (DBH, "%s: smbHdl = %08p\n", functionName, smbHdl) );

	smbHdl->entries.Capability = SMB_FUNC_SMBUS_QUICK |
	                             SMB_FUNC_SMBUS_BYTE |
								 SMB_FUNC_SMBUS_BYTE_DATA |
								 SMB_FUNC_SMBUS_WORD_DATA |
								 SMB_FUNC_SMBUS_BLOCK_DATA |
								 SMB_FUNC_SMBUS_HWPEC_CALC;	/* HW PEC supported */

    smbHdl->smbComHdl.busyWait  = descP->busyWait;

	smbHdl->baseAddr 			= (MACCESS)descP->baseAddr;

	smbHdl->ownSize  			= gotSize;

	smbHdl->entries.Exit		= (int32 (*)(void**))LocSmbExit;
	smbHdl->entries.SmbXfer		= (int32 (*)(void *, u_int32, u_int16,
							  				u_int8, u_int8, u_int8, u_int8 *))
											LocSmbXfer;

	smbHdl->entries.I2CXfer		= NULL;
	smbHdl->entries.Ident		= (char* (*)(void))LocSmbIdent;

	error = SMB_COM_Init(smbHdl);
    if( error )
    {
   		DBGWRT_ERR((DBH, "*** %s: SMB_COM_Init\n", functionName ));
        goto CLEANUP;
    }

    /* clear status first */
	MWRITE_D8(smbHdl->baseAddr, SMB_HST_STS, SMB_CLEAR_STATUS);

    /*
	 * set E32B bit for block access
	 * This enables the block commands to transfer or receive up to 32-bytes.
	 */
	MWRITE_D8(smbHdl->baseAddr, SMB_AUX_CTL, EN_32BYTE_BUFFER);

CLEANUP:
	return( error );
}/* SMB_FCH_Init */
