#!/bin/bash
#

# PWD == openwrt
## Go Version = 1.22.2
sed -e 's/\(GO_VERSION_MAJOR_MINOR:=\).*/\11.22/' \
    -e 's/\(GO_VERSION_PATCH:=\).*/\12/' \
    -i ./feeds/packages/lang/golang/golang/Makefile

## Rust Version = stable
### stable, beta, nightly, 1.30.0, nightly-2018-08-01
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install stable
