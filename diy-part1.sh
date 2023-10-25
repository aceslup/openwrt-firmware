#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================
# PWD=/home/runner/work/openwrt-firmware/openwrt-firmware/openwrt


#【lean】：去掉无刚需的默认插件
sed -e 's/ddns-scripts_aliyun//g' \
    -e 's/ddns-scripts_dnspod//g' \
    -e 's/luci-app-ddns//g' \
    -e 's/luci-app-vsftpd//g' \
    -e 's/luci-app-accesscontrol//g' \
    -e 's/luci-app-nlbwmon//g' \
    -e 's/coremark//g' -i ./include/target.mk

#【lean】：禁用 coolsnowwolf/luci/applications 软件源
#sed -i 's/\(^src-git packages.*\)/#\1/' feeds.conf.default
#sed -i 's/\(^src-git luci.*\)/#\1/' feeds.conf.default


#【lean】: ssr+
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld'  feeds.conf.default


# 清理 coolsnowwolf/packages 无需的软件包。改由 kenzok8/small-package 提供
git clone https://github.com/coolsnowwolf/packages ./feeds/packages
git clone https://github.com/coolsnowwolf/luci ./feeds/luci

# syncthing
#rm -rf ./feeds/packages/utils/syncthing/files/etc/config/syncthing
#rm -rf ./feeds/packages/utils/syncthing/files/etc/init.d/syncthing
#tree ./feeds/packages/utils/syncthing 

# aliyundrive-webdav
rm -rf ./feeds/packages/multimedia/aliyundrive-webdav
rm -rf ./feeds/luci/applications/luci-app-aliyundrive-webdav
#cp -r ./feeds/smpackage/aliyundrive-webdav ./feeds/packages/multimedia/
#cp -r ./feeds/smpackage/luci-app-aliyundrive-webdav ./feeds/luci/applications/

# aliyundrive-fuse
rm -rf ./feeds/packages/multimedia/aliyundrive-fuse
rm -rf ./feeds/luci/applications/luci-app-aliyundrive-fuse
#cp -r ./feeds/smpackage/aliyundrive-fuse ./feeds/packages/multimedia/
#cp -r ./feeds/smpackage/luci-app-aliyundrive-fuse ./feeds/luci/applications/


#【lienol】: passwall,syncthing
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default


#【kenzok8】: passwall,ssr+,vssr,gost,smartdns,serverchan,jd-dailybonus
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

#【kenzok8】: 追新软件包
# PATH=/home/runner/work/openwrt-firmware/openwrt-firmware/openwrt/feeds/smpackage
# 行尾追加
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# 首行插入，尝试 kenzok8/small-package 软件源优先解析于 coolsnowwolf/packages
#sed -i '1i src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default


#【tty228】: luci-app-wechatpush
git clone https://github.com/tty228/luci-app-wechatpush `pwd`/package/luci-app-wechatpush


#【xiaorouji】:
#sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default


#【homelede】: homeconnect,ssr+,smartdns,serverchan,jd-dailybonus
#sed -i '$a src-git xiaoqingfeng https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng' feeds.conf.default


#【vernesong】: openclash
#sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default


#【pymumu】：SmartDNS
#WORKINGDIR="`pwd`/feeds/packages/net/smartdns"
#mkdir $WORKINGDIR -p
#rm $WORKINGDIR/* -fr
#wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
#unzip $WORKINGDIR/master.zip -d $WORKINGDIR
#mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
#rmdir $WORKINGDIR/openwrt-smartdns-master
#rm $WORKINGDIR/master.zip

## master分支  为openwrt 19.07之后版本使用, 此版本基于javascript
## lede分支    为lede分支使用, 此版本基于lua
#LUCIBRANCH="lede"

#WORKINGDIR="`pwd`/feeds/luci/applications/luci-app-smartdns"
#mkdir $WORKINGDIR -p
#rm $WORKINGDIR/* -fr
#wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
#unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
#mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
#rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
#rm $WORKINGDIR/${LUCIBRANCH}.zip


######################################################## 散装软件
#【kuoruan】：Kcptun
#git clone https://github.com/kuoruan/luci-app-kcptun.git `pwd`/package/luci-app-kcptun


#【xiaoqingfengATGH】：ServerChan
#git clone https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng
#cp -r feeds-xiaoqingfeng/luci-app-serverchan `pwd`/package/lean/
#rm -rf feeds-xiaoqingfeng


#【281677160】: clash,openclash,vssr,gost,gowebdav,pushbot,serverchan,smartdns,syncthing,ttnode,oaf
#git clone https://github.com/281677160/openwrt-package
#GITCLONE_APP="openwrt-package/feeds/luci/applications"
#GITCLONE_NET="openwrt-package/feeds/packages/net"
#GITCLONE_UTILS="openwrt-package/feeds/packages/utils"

#LUCI_APP_PATH="`pwd`/feeds/luci/applications" && mkdir -pv ${LUCI_APP_PATH}
#LUCI_NET_PATH="`pwd`/feeds/packages/net" && mkdir -pv ${LUCI_NET_PATH}
#LUCI_UTILS_PATH="`pwd`/feeds/packages/utils" && mkdir -pv ${LUCI_UTILS_PATH}

## Add gost
#mv ${GITCLONE_APP}/luci-app-gost ${LUCI_APP_PATH}/
#mv ${GITCLONE_NET}/gost ${LUCI_NET_PATH}/
## Add gowebdav
#mv ${GITCLONE_APP}/luci-app-gowebdav ${LUCI_APP_PATH}/
#mv ${GITCLONE_NET}/gowebdav ${LUCI_NET_PATH}/
## Add luci-app-syncthing
#mv ${GITCLONE_APP}/luci-app-syncthing ${LUCI_APP_PATH}/
## Add luci-app-pushbot
#mv ${GITCLONE_APP}/luci-app-pushbot ${LUCI_APP_PATH}/
## Add luci-app-serverchan
#mv ${GITCLONE_APP}/luci-app-serverchan ${LUCI_APP_PATH}/
## Add luci-app-ttnode
#mv ${GITCLONE_APP}/luci-app-ttnode ${LUCI_APP_PATH}/
#rm -rf openwrt-package


#【kenzok8】: passwall,ssr+,vssr,gost,smartdns,serverchan,jd-dailybonus
#git clone https://github.com/kenzok8/openwrt-packages
# Add luci-app-gost
#cp -r openwrt-packages/{luci-app-gost,gost} `pwd`/package/lean/
# Add luci-app-openclash
#cp -r openwrt-packages/luci-app-openclash `pwd`/package/lean/
# Add luci-app-clash
#cp -r openwrt-packages/luci-app-clash `pwd`/package/lean/
#rm -rf openwrt-packages


#【jerrykuku】：HelloWorld, lua-maxminddb dep+
#rm -rf `pwd`/package/lean/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
#git clone https://github.com/jerrykuku/lua-maxminddb.git
#git clone https://github.com/jerrykuku/luci-app-vssr.git 
#mv luci-theme-argon lua-maxminddb luci-app-vssr `pwd`/package/lean/


#【xiaoqingfengATGH】: homeconnect,ssr+,smartdns,serverchan,jd-dailybonus
# Add luci-app-homeconnect
#git clone https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng.git
#mv feeds-xiaoqingfeng/luci-app-homeconnect `pwd`/package/lean/
#mv feeds-xiaoqingfeng/softethervpn5 `pwd`/package/lean/
#rm -rf feeds-xiaoqingfeng


#【xiaoqingfengATGH】: homeclash
# Add homeclash
#git clone https://github.com/xiaoqingfengATGH/homeclash
#cp -r homeclash/luci-app-openclash `pwd`/package/lean/
#rm -rf homeclash


#【jerrykuku】：luci-app-jd-dailybonus
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git `pwd`/package/lean/luci-app-jd-dailybonus


#【openwrt/packages】：syncthing
#PWD=/home/runner/work/openwrt-firmware/openwrt-firmware/openwrt
#git clone https://github.com/openwrt/packages ./tmp/
#mv ./tmp/utils/syncthing ./feeds/packages/utils/
#rm -rf ./feeds/packages/utils/syncthing/files/etc/config/syncthing
#rm -rf ./feeds/packages/utils/syncthing/files/etc/init.d/syncthing
#tree ./feeds/packages/utils/syncthing
#rm -rf tmp


echo 1111111111111111
cat feeds.conf.default
echo 1111111111111111
