#**************************  M a k e f i l e ********************************
#
#         Author: dieter.pfeuffer@men.de
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



MAK_NAME=smb2
# the next line is updated during the MDIS installation
STAMPED_REVISION="mdis_libsrc_smb2_com_01_34-8-g6742436_2019-06-07"

DEF_REVISION=MAK_REVISION=$(STAMPED_REVISION)

MAK_LIBS=

MAK_SWITCH=$(SW_PREFIX)MAC_MEM_MAPPED \
		$(SW_PREFIX)$(DEF_REVISION)

MAK_INCL=$(MEN_INC_DIR)/men_typs.h \
         $(MEN_INC_DIR)/oss.h \
         $(MEN_INC_DIR)/dbg.h \
         $(MEN_INC_DIR)/maccess.h \
         $(MEN_INC_DIR)/smb2.h

MAK_INP1=smb2_com$(INP_SUFFIX)
MAK_INP2=smb2_menz001$(INP_SUFFIX)
MAK_INP3=smb2_mgt5200$(INP_SUFFIX)
MAK_INP4=smb2_ich$(INP_SUFFIX)
MAK_INP5=smb2_fch$(INP_SUFFIX)
MAK_INP6=
MAK_INP7=
MAK_INP8=
MAK_INP9=

MAK_INP=$(MAK_INP1)\
		$(MAK_INP2)\
		$(MAK_INP3)\
		$(MAK_INP4)\
		$(MAK_INP5)\
		$(MAK_INP6)\
		$(MAK_INP7)\
		$(MAK_INP8)\
		$(MAK_INP9)



