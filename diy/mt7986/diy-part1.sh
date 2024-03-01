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
####### 更换packages源 #######
sed -i 's/^src-git-full packages https:\/\/github.com\/immortalwrt\/packages.git;openwrt-21.02/#&/' feeds.conf.default
sed -i 's/^src-git-full luci https:\/\/github.com\/immortalwrt\/luci.git;openwrt-21.02/#&/' feeds.conf.default
echo 'src-git packages https://github.com/kenzok8/small-package.git;main' >>feeds.conf.default
####### 科学上网插件 #######
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >>feeds.conf.default
# echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;luci-smartdns-dev' >>feeds.conf.default
# echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;main' >>feeds.conf.default
