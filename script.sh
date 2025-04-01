#!/bin/bash

# usbrelay HURTM_1=1 needs to be executed before the DUT is powered on, so that the DUT enters USB boot mode
# HURTM_2 controls power
# After flashing is completed, usbrelay needs to toggle the sdp relay to off (HURTM_1) and cut power from the DUT (HURTM_2),
# so the next boot will be from eMMC.
# The relay is in NC mode and connects SW2 pins 1 and 4 on the carrier board.

# Vanilla U-boot needs to be built with
#--- a/common/autoboot.c
#+++ b/common/autoboot.c
#@@ -318,7 +318,7 @@ const char *bootdelay_process(void)
#                bootdelay = 0;
#        } else if (is_boot_from_usb()) {
#                printf("Boot from USB for uuu\n");
#-               env_set("bootcmd", "fastboot 0");
#+               env_set("bootcmd", "echo Booting iMX6UL from UMS; ums 1 mmc 1;");
#        } else {
#                printf("Normal Boot\n");
#        }


pushd /usr/src/app/imx_usb_loader/
./imx_usb &  export _PID=$! ; sleep 5; kill ${_PID} && ./imx_usb

exit $?
