#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate

# 解决rust问题
curl -o ./feeds/packages/lang/rust/rust-values.mk \
  https://raw.githubusercontent.com/Jason6111/packages/patch-1/lang/rust/rust-values.mk
curl -o ./feeds/packages/lang/rust/Makefile \
  https://raw.githubusercontent.com/Jason6111/OpenWrt_Personal/main/other/rust/Makefile
curl -o ./feeds/packages/lang/rust/patches/0001-Update-xz2-and-use-it-static.patch \
  https://raw.githubusercontent.com/Jason6111/OpenWrt_Personal/main/other/rust/0001-Update-xz2-and-use-it-static.patch
