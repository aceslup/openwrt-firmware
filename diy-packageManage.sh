#!/bin/bash
#
# PWD == openwrt

## Go Version = 1.22.2
## https://golang.google.cn/dl/
#sed -e 's/\(GO_VERSION_MAJOR_MINOR:\)=.*/\1=1.22/' \
#    -e 's/\(GO_VERSION_PATCH:\)=.*/\1=2/' \
#    -e 's/\(PKG_HASH:\)=.*/\1=58f0c5ced45a0012bce2ff7a9df03e128abcc8818ebabe5027bb92bafe20e421/' \
#    -i ./feeds/packages/lang/golang/golang/Makefile

## Rust Version = stable
### Optional: stable, beta, nightly, nightly-2018-08-01, 1.30.0
### wget https://sh.rustup.rs -LO rustup-init.sh
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh \
  && sudo sh ./rustup-init.sh -y
