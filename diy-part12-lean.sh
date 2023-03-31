#!/bin/bash
#

# 清理 coolsnowwolf/packages 无需的软件包。改由 kenzok8/small-package 提供
# syncthing
rm -rf ./feeds/packages/utils/syncthing/files/etc/config/syncthing
rm -rf ./feeds/packages/utils/syncthing/files/etc/init.d/syncthing
tree ./feeds/packages/utils/syncthing 

# aliyundrive-webdav
rm -rf ./feeds/packages/multimedia/aliyundrive-webdav

# aliyundrive-fuse
rm -rf ./feeds/packages/multimedia/aliyundrive-fuse

# UnblockNeteaseMusic-Go
rm -rf ./feeds/packages/multimedia/UnblockNeteaseMusic-Go

# UnblockNeteaseMusic
rm -rf ./feeds/packages/multimedia/UnblockNeteaseMusic

./scripts/feeds update -a
