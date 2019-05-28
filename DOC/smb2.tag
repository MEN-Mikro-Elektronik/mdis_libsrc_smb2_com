<?xml version='1.0' encoding='ISO-8859-1' standalone='yes'?>
<tagfile>
  <compound kind="page">
    <filename>index</filename>
    <title></title>
    <name>index</name>
    <docanchor>smb2_specific</docanchor>
    <docanchor>Documents</docanchor>
    <docanchor>General</docanchor>
    <docanchor>FuncDesc</docanchor>
    <docanchor>smb2_com</docanchor>
    <docanchor>supported_controllers</docanchor>
  </compound>
  <compound kind="file">
    <name>smb2.h</name>
    <path>/opt/menlinux/INCLUDE/COM/MEN/</path>
    <filename>smb2_8h</filename>
    <class kind="struct">I2CMESSAGE</class>
    <class kind="struct">SMB_COM_HANDLE</class>
    <class kind="struct">SMB_DESC_ALI1543</class>
    <class kind="struct">SMB_DESC_FCH</class>
    <class kind="struct">SMB_DESC_FSLIMX6</class>
    <class kind="struct">SMB_DESC_ICH</class>
    <class kind="struct">SMB_DESC_MENZ001</class>
    <class kind="struct">SMB_DESC_MGT5200</class>
    <class kind="struct">SMB_DESC_MPC85XX</class>
    <class kind="struct">SMB_DESC_PORTCB</class>
    <class kind="struct">SMB_DESC_SCH</class>
    <class kind="struct">SMB_ENTRIES</class>
    <member kind="define">
      <type>#define</type>
      <name>I2C_M_TEN</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>I2C_M_WR</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>I2C_M_RD</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>I2C_M_NOSTART</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ADDR_GENERAL_CALL</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ADDR_10BIT_SLAVE</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ADDR_ALERT_RESPONSE</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_READ</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_WRITE</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FUNC_I2C</name>
      <anchor>a11</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FUNC_10BIT_ADDR</name>
      <anchor>a12</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FUNC_SMBUS_HWPEC_CALC</name>
      <anchor>a14</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FUNC_SMBUS_READ_I2C_BLOCK</name>
      <anchor>a26</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FUNC_SMBUS_WRITE_I2C_BLOCK</name>
      <anchor>a27</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_DESCRIPTOR</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO_MEM</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ADDR</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_BUSY</name>
      <anchor>a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_COLL</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO_DEVICE</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_PARAM</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_PEC</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NOT_SUPPORTED</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_GENERAL</name>
      <anchor>a11</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ALERT_INSTALL</name>
      <anchor>a12</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ALERT_NOSIG</name>
      <anchor>a13</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ADDR_EXCLUDED</name>
      <anchor>a14</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO_IDLE</name>
      <anchor>a15</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_CTRL_BUSY</name>
      <anchor>a16</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_LAST</name>
      <anchor>a17</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FLAG_TENBIT</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FLAG_PEC</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_BLOCK_MAX_BYTES</name>
      <anchor>a60</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>I2C_BLOCK_MAX_BYTES</name>
      <anchor>a61</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ACC_QUICK</name>
      <anchor>a62</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>I2CMESSAGE</type>
      <name>SMB_I2CMESSAGE</name>
      <anchor>a70</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_COM_Init</name>
      <anchor>a72</anchor>
      <arglist>(void *smbHdl)</arglist>
    </member>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_MENZ001_Init</name>
      <anchor>a73</anchor>
      <arglist>(SMB_DESC_MENZ001 *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_ICH_Init</name>
      <anchor>a76</anchor>
      <arglist>(SMB_DESC_ICH *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_FCH_Init</name>
      <anchor>a78</anchor>
      <arglist>(SMB_DESC_FCH *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_SCH_Init</name>
      <anchor>a80</anchor>
      <arglist>(SMB_DESC_SCH *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>smb2_com.c</name>
    <path>/opt/menlinux/LIBSRC/SMB2/COM/</path>
    <filename>smb2__com_8c</filename>
    <class kind="struct">SMB_ALERT_NODE</class>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_COM_Init</name>
      <anchor>a27</anchor>
      <arglist>(void *smbHdlP)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>smb2_fch.c</name>
    <path>/opt/menlinux/LIBSRC/SMB2/COM/</path>
    <filename>smb2__fch_8c</filename>
    <class kind="struct">SMB_HANDLE</class>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_FCH_Init</name>
      <anchor>a67</anchor>
      <arglist>(SMB_DESC_FCH *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>smb2_ich.c</name>
    <path>/opt/menlinux/LIBSRC/SMB2/COM/</path>
    <filename>smb2__ich_8c</filename>
    <class kind="struct">SMB_HANDLE</class>
    <member kind="function">
      <type>u_int32</type>
      <name>SMB_ICH_Init</name>
      <anchor>a67</anchor>
      <arglist>(SMB_DESC_ICH *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>smb2_sch.c</name>
    <path>/opt/menlinux/LIBSRC/SMB2/COM/</path>
    <filename>smb2__sch_8c</filename>
    <class kind="struct">SMB_HANDLE</class>
    <member kind="function">
      <type>u_int32 SMB_SCH_IO_Init u_int32</type>
      <name>SMB_SCH_Init</name>
      <anchor>a13</anchor>
      <arglist>(SMB_DESC_SCH *descP, OSS_HANDLE *osHdl, void **smbHdlP)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>I2CMESSAGE</name>
    <filename>structI2CMESSAGE.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>addr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>flags</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>len</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int8 *</type>
      <name>buf</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_ALERT_NODE</name>
    <filename>structSMB__ALERT__NODE.html</filename>
    <member kind="variable">
      <type>OSS_DL_NODE</type>
      <name>node</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>addr</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void(*</type>
      <name>alertCb</name>
      <anchor>m2</anchor>
      <arglist>)(void *cbArg)</arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>alertCbArg</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>gotsize</name>
      <anchor>m4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_COM_HANDLE</name>
    <filename>structSMB__COM__HANDLE.html</filename>
    <member kind="variable">
      <type>OSS_HANDLE *</type>
      <name>osHdl</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>DBG_HANDLE *</type>
      <name>dbgHdl</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>OSS_SEM_HANDLE *</type>
      <name>hostCtrlSem</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>busyWait</name>
      <anchor>m4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>OSS_ALARM_HANDLE *</type>
      <name>alarmHdl</name>
      <anchor>m5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>OSS_DL_LIST</type>
      <name>smbAlertCb</name>
      <anchor>m7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>ExitCom</name>
      <anchor>m8</anchor>
      <arglist>)(void *smbHdl)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_ALI1543</name>
    <filename>structSMB__DESC__ALI1543.html</filename>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_FCH</name>
    <filename>structSMB__DESC__FCH.html</filename>
    <member kind="variable">
      <type>void *</type>
      <name>baseAddr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>busyWait</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_FSLIMX6</name>
    <filename>structSMB__DESC__FSLIMX6.html</filename>
    <member kind="variable">
      <type>u_int32</type>
      <name>unit</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>timeOut</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>mikroDelay</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_ICH</name>
    <filename>structSMB__DESC__ICH.html</filename>
    <member kind="variable">
      <type>void *</type>
      <name>baseAddr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>busyWait</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_MENZ001</name>
    <filename>structSMB__DESC__MENZ001.html</filename>
    <member kind="variable">
      <type>void *</type>
      <name>baseAddr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>sclFreq</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>busyWait</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>timeOut</name>
      <anchor>m5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>mikroDelay</name>
      <anchor>m6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>multimasterCap</name>
      <anchor>m7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_MGT5200</name>
    <filename>structSMB__DESC__MGT5200.html</filename>
    <member kind="variable">
      <type>void *</type>
      <name>baseAddr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>divReg</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>filterReg</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>timeOut</name>
      <anchor>m4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>mikroDelay</name>
      <anchor>m5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>multimasterCap</name>
      <anchor>m7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_MPC85XX</name>
    <filename>structSMB__DESC__MPC85XX.html</filename>
    <member kind="variable">
      <type>void *</type>
      <name>baseAddr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>divReg</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>filterReg</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>timeOut</name>
      <anchor>m4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>mikroDelay</name>
      <anchor>m5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_PORTCB</name>
    <filename>structSMB__DESC__PORTCB.html</filename>
    <member kind="variable">
      <type>u_int8</type>
      <name>busClock</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>cbArg</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>sclIn</name>
      <anchor>m2</anchor>
      <arglist>)(void *)</arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>sclSet</name>
      <anchor>m3</anchor>
      <arglist>)(void *, int val)</arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>sdaIn</name>
      <anchor>m4</anchor>
      <arglist>)(void *)</arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>sdaSet</name>
      <anchor>m5</anchor>
      <arglist>)(void *, int val)</arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_DESC_SCH</name>
    <filename>structSMB__DESC__SCH.html</filename>
    <member kind="variable">
      <type>void *</type>
      <name>baseAddr</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>dbgLevel</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>alertPollFreq</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>busyWait</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_ENTRIES</name>
    <filename>structSMB__ENTRIES.html</filename>
    <member kind="function">
      <type>char *__MAPILIB *</type>
      <name>Ident</name>
      <anchor>a0</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a1</anchor>
      <arglist>(__MAPILIB *Exit)(void **smbHdlP)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a2</anchor>
      <arglist>(__MAPILIB *QuickComm)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a3</anchor>
      <arglist>(__MAPILIB *WriteByte)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a4</anchor>
      <arglist>(__MAPILIB *ReadByte)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a5</anchor>
      <arglist>(__MAPILIB *WriteByteData)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a6</anchor>
      <arglist>(__MAPILIB *ReadByteData)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a7</anchor>
      <arglist>(__MAPILIB *WriteWordData)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a8</anchor>
      <arglist>(__MAPILIB *ReadWordData)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a9</anchor>
      <arglist>(__MAPILIB *WriteBlockData)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a10</anchor>
      <arglist>(__MAPILIB *ReadBlockData)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a11</anchor>
      <arglist>(__MAPILIB *ProcessCall)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a12</anchor>
      <arglist>(__MAPILIB *BlockProcessCall)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a13</anchor>
      <arglist>(__MAPILIB *AlertResponse)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a14</anchor>
      <arglist>(__MAPILIB *AlertCbInstall)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a16</anchor>
      <arglist>(__MAPILIB *AlertCbRemove)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a20</anchor>
      <arglist>(__MAPILIB *UseOssDelay)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a21</anchor>
      <arglist>(__MAPILIB *SmbXfer)(void *smbHdl</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>int32</name>
      <anchor>a22</anchor>
      <arglist>(__MAPILIB *I2CXfer)(void *smbHdl</arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>Capability</name>
      <anchor>m30</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>SMB_HANDLE</name>
    <filename>structSMB__HANDLE.html</filename>
    <member kind="variable">
      <type>SMB_ENTRIES</type>
      <name>entries</name>
      <anchor>m0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>SMB_COM_HANDLE</type>
      <name>smbComHdl</name>
      <anchor>m1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>ownSize</name>
      <anchor>m2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MACCESS</type>
      <name>baseAddr</name>
      <anchor>m3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>timeOut</name>
      <anchor>m4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>mikroDelay</name>
      <anchor>m5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>VXB_DEVICE_ID</type>
      <name>busCtrlId</name>
      <anchor>m6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>multimaster</name>
      <anchor>m7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>smb2dummy</name>
    <title>MEN logo</title>
    <filename>smb2dummy</filename>
  </compound>
  <compound kind="group">
    <name>_SMB2_ERR</name>
    <title>SMB_ERR_X Error Codes</title>
    <filename>group____SMB2__ERR.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_DESCRIPTOR</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO_MEM</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ADDR</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_BUSY</name>
      <anchor>a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_COLL</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO_DEVICE</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_PARAM</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_PEC</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NOT_SUPPORTED</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_GENERAL</name>
      <anchor>a11</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ALERT_INSTALL</name>
      <anchor>a12</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ALERT_NOSIG</name>
      <anchor>a13</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_ADDR_EXCLUDED</name>
      <anchor>a14</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_NO_IDLE</name>
      <anchor>a15</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_CTRL_BUSY</name>
      <anchor>a16</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_ERR_LAST</name>
      <anchor>a17</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_SMB2_FLAG</name>
    <title>SMB_FLAG_X flags</title>
    <filename>group____SMB2__FLAG.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FLAG_TENBIT</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>SMB_FLAG_PEC</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
  </compound>
</tagfile>
