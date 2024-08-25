#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add a feed source
sed -i '$a src-git openwrt_kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default

####### passwall smartnds分支 #######
git clone https://github.com/xiaorouji/openwrt-passwall -b luci-smartdns-dev package/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/luci-app-passwall-packages
# curl -s https://raw.githubusercontent.com/sbwml/openwrt_helloworld/v5/shadowsocks-rust/Makefile | sed 's/^/ /' > package/luci-app-passwall-packages/shadowsocks-rust/Makefile

