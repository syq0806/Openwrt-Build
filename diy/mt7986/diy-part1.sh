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


####### 科学上网插件 #######
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/luci-app-passwall-packages
curl -s https://raw.githubusercontent.com/sbwml/openwrt_helloworld/v5/shadowsocks-rust/Makefile | sed 's/^/ /' > package/luci-app-passwall-packages/shadowsocks-rust/Makefile
# git clone -b master --depth=1 --filter=blob:none --sparse https://github.com/vernesong/OpenClash.git package/luci-app-openclash
# git -C package/luci-app-openclash sparse-checkout set luci-app-openclash
####### Smartdns插件 #######
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns -b master package/luci-app-smartdns
####### DDNS-GO插件 #######
git clone https://github.com/sirpdboy/luci-app-ddns-go package/ddns-go
