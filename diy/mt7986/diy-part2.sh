#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.1.10/g' package/base-files/files/bin/config_generate

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

########### 更新内置的smartdns版本 ###########
curl -sL https://raw.githubusercontent.com/pymumu/smartdns/master/package/openwrt/Makefile > feeds/packages/net/smartdns/Makefile

########### 更新内置的passwall版本 ###########
rsync -a feeds/passwall_luci/luci-app-passwall/  feeds/luci/applications/luci-app-passwall/
rsync -a feeds/passwall_packages/ feeds/packages/net/
pushd feeds/packages/lang
rm -rf golang && svn co https://github.com/sbwml/packages_lang_golang/tree/22.x/golang
