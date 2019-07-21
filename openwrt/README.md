# OpenWrt-Related Scripts

## Build All Targets (build-all-targets.sh)
If you want to build OpenWrt for more than a single device, use the OpenWrt build enviroments script (```./<buildroot>/scripts/env```). You can learn more about OpenWrt build enviroments [here](https://openwrt.org/docs/guide-developer/env).

This script will iterate through each enviroment and build the corresponding targets.

Place the file in your OpenWrt buildroot. It won't work if it's placed elsewhere.

Number of cores used to compile should be set in the script (n+1).
