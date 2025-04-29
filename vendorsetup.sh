#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="pacman"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	# Locale
   	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"

	# Apparently Recommended exports?
	export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export OF_VANILLA_BUILD=0

	# Device Specifics
        export TARGET_DEVICE_ALT="A142"
	export FOX_AB_DEVICE=1

	# Lights
	export OF_FLASHLIGHT_ENABLE=0
	export OF_USE_GREEN_LED=0

	# Display
	export OF_SCREEN_H=2400
	export OF_STATUS_H=90
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_HIDE_NOTCH=1

	# Tools
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_NANO_EDITOR=1
	export OF_ENABLE_LPTOOLS=1
	export FOX_ENABLE_APP_MANAGER=0
	export FOX_DELETE_AROMAFM=1

	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_PATCH_AVB20=1
	export OF_DEFAULT_KEYMASTER_VERSION=4.1
        export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
        export OF_FBE_METADATA_MOUNT_IGNORE=1

        # OTA
        export OF_KEEP_DM_VERITY=1
        export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
        export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# R12.1 Settings
	export FOX_VERSION="R12.1_InternalBeta"
	export OF_MAINTAINER="pacman-Development"

	# Build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
