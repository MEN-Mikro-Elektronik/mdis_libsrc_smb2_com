#**************************  M a k e f i l e ********************************
#  
#         Author: dieter.pfeuffer@men.de
#          $Date: 2010/12/20 13:14:54 $
#      $Revision: 1.3 $
#  
#    Description: makefile descriptor for SMB2 library
#                      
#-----------------------------------------------------------------------------
#   Copyright (c) 2019, MEN Mikro Elektronik GmbH
#*****************************************************************************
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.



MAK_NAME=smb2_io

MAK_LIBS=

MAK_SWITCH=$(SW_PREFIX)MAC_IO_MAPPED

MAK_INCL=$(MEN_INC_DIR)/men_typs.h \
         $(MEN_INC_DIR)/oss.h \
         $(MEN_INC_DIR)/dbg.h \
         $(MEN_INC_DIR)/maccess.h \
         $(MEN_INC_DIR)/smb2.h

MAK_INP1=smb2_com$(INP_SUFFIX)
MAK_INP2=smb2_ich$(INP_SUFFIX)
MAK_INP3=smb2_sch$(INP_SUFFIX)
MAK_INP4=smb2_menz001$(INP_SUFFIX)
MAK_INP5=smb2_fch$(INP_SUFFIX)

MAK_INP=$(MAK_INP1)\
		$(MAK_INP2) \
		$(MAK_INP3) \
		$(MAK_INP4) \
		$(MAK_INP5)

