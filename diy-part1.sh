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
    -e 's/coremark//g' \
    -i ./include/target.mk


# 重写插件源
#tee ./feeds.conf.default <<-'EOF'
#
## kenzok8: 追新插件包
#src-git smpackage https://github.com/kenzok8/small-package
#
## 官方依赖包
#src-git routing https://git.openwrt.org/feed/routing.git
#src-git telephony https://git.openwrt.org/feed/telephony.git
#
## lienol: 依赖组件包
#src-git packages https://github.com/Lienol/openwrt-packages.git;master
#src-git luci https://github.com/Lienol/openwrt-luci.git;master
#
## lienol: 插件包
##src-git lienol https://github.com/Lienol/openwrt-package.git;main
##src-git other https://github.com/Lienol/openwrt-package.git;other
## xiaorouji: passwall
##src-git passwall https://github.com/xiaorouji/openwrt-passwall
#
## lean: ssr+
##src-git helloworld https://github.com/fw876/helloworld
##src-git lean https://github.com/coolsnowwolf/packages
#
## tty228: wechatpush
#src-git wechatpush https://github.com/tty228/luci-app-wechatpush
#
## homelede: homeconnect,ssr+,smartdns,serverchan,jd-dailybonus
##src-git xiaoqingfeng https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng
#
## vernesong: openclash
##src-git OpenClash https://github.com/vernesong/OpenClash
#
## nxhack: node
##src-git node https://github.com/nxhack/openwrt-node-packages.git
#
#EOF


#【lean】：禁用 coolsnowwolf/luci/applications 软件源
#sed -i 's/\(^src-git packages.*\)/#\1/' feeds.conf.default
#sed -i 's/\(^src-git luci.*\)/#\1/' feeds.conf.default

#【lean】: ssr+
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld'  feeds.conf.default


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


#【xiaorouji】:
#sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default


#【homelede】: homeconnect,ssr+,smartdns,serverchan,jd-dailybonus
#sed -i '$a src-git xiaoqingfeng https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng' feeds.conf.default


#【vernesong】: openclash
#sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default


echo 1111111111111111
cat feeds.conf.default
echo 1111111111111111
