#!/bin/bash
#

# 清理 coolsnowwolf/packages 无需的软件包。改由 kenzok8/small-package 提供
# syncthing
rm -rf ./feeds/packages/utils/syncthing/files/etc/config/syncthing
rm -rf ./feeds/packages/utils/syncthing/files/etc/init.d/syncthing
tree ./feeds/packages/utils/syncthing 

# aliyundrive-webdav
rm -rf ./feeds/packages/multimedia/aliyundrive-webdav
cp -r ./feeds/smpackage/aliyundrive-webdav ./feeds/packages/multimedia/
#rm -rf ./feeds/packages/applications/luci-app-aliyundrive-webdav
#cp -r ./feeds/smpackage/luci-app-aliyundrive-webdav ./feeds/packages/applications/

# aliyundrive-fuse
rm -rf ./feeds/packages/multimedia/aliyundrive-fuse
cp -r ./feeds/smpackage/aliyundrive-fuse ./feeds/packages/multimedia/
#rm -rf ./feeds/packages/applications/luci-app-aliyundrive-fuse
#cp -r ./feeds/smpackage/luci-app-aliyundrive-fuse ./feeds/packages/applications/

# UnblockNeteaseMusic-Go
#rm -rf ./feeds/packages/multimedia/UnblockNeteaseMusic-Go
#cp -r ./feeds/smpackage/UnblockNeteaseMusic-Go ./feeds/packages/multimedia/

# UnblockNeteaseMusic
rm -rf ./feeds/packages/multimedia/UnblockNeteaseMusic
#cp -r ./feeds/smpackage/UnblockNeteaseMusic ./feeds/packages/multimedia/

./scripts/feeds update -a
