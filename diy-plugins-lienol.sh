#!/bin/bash
#

# Add SmartDNS
WORKINGDIR="`pwd`/feeds/packages/net/smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
rmdir $WORKINGDIR/openwrt-smartdns-master
rm $WORKINGDIR/master.zip

# master分支  为openwrt 19.07之后版本使用, 此版本基于javascript
# lede分支    为lede分支使用, 此版本基于lua
LUCIBRANCH="lede"

WORKINGDIR="`pwd`/feeds/luci/applications/luci-app-smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
rm $WORKINGDIR/${LUCIBRANCH}.zip


# Add Kcptun
git clone https://github.com/kuoruan/luci-app-kcptun.git `pwd`/package/luci-app-kcptun


# Add SRP+ dept
git clone https://github.com/coolsnowwolf/lede
cp -r lede/package/lean/{tcpping,microsocks,redsocks2} feeds/helloworld/
rm -rf lede


# Add GOST, CLASH
git clone https://github.com/kenzok8/openwrt-packages
cp -r openwrt-packages/{gost,luci-app-gost} `pwd`/package/lean/
cp -r openwrt-packages/{luci-app-openclash,luci-app-clash} `pwd`/package/lean/
rm -rf openwrt-packages


# Add ServerChan
git clone https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng
cp -r feeds-xiaoqingfeng/luci-app-serverchan `pwd`/package/lean/
rm -rf feeds-xiaoqingfeng


# Add homeclash
#git clone https://github.com/xiaoqingfengATGH/homeclash
#cp -r homeclash/luci-app-openclash `pwd`/package/lean/
#rm -rf homeclash


./scripts/feeds update -a
