#!/bin/bash
#
# PWD == openwrt

## Go Version = 1.22.2
## https://golang.google.cn/dl/
#sed -e 's/\(GO_VERSION_MAJOR_MINOR:\)=.*/\1=1.22/' \
#    -e 's/\(GO_VERSION_PATCH:\)=.*/\1=2/' \
#    -e 's/\(PKG_HASH:\)=.*/\1=374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9/' \
#    -i ./feeds/packages/lang/golang/golang/Makefile

## 直接修改的总是报错, 尝试替换比较激进的 coolsnowwolf/packages/lang/golang 目录
#rm -rf ./feeds/packages/lang/golang
#git clone https://github.com/coolsnowwolf/packages lean_packages
#mv ./lean_packages/lang/golang ./feeds/packages/lang/
#rm -rf ./lean_packages


## Rust Version = stable
### Optional: stable, beta, nightly, nightly-2018-08-01, 1.30.0
### wget https://sh.rustup.rs -LO rustup-init.sh
#sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh \
#  && sudo sh ./rustup-init.sh -y
