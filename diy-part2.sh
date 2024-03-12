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
sed -i 's/192.168.1.1/192.168.1.10/g' package/base-files/files/bin/config_generate
########### 设置密码为空（可选） ###########
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings


########### 更改默认主题（可选）###########
# 删除自定义源默认的 argon 主题
# rm -rf package/lean/luci-theme-argon
# 拉取 argon 原作者的源码
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile
# make menuconfig时记得勾选LuCI ---> Applications ---> luci-app-argon-config

########### 更新内置的smartdns版本 ###########
curl -sL https://raw.githubusercontent.com/pymumu/smartdns/master/package/openwrt/Makefile > feeds/packages/net/smartdns/Makefile

########### 安装smartdns（必选）###########
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
# git clone https://github.com/pymumu/smartdns.git package/smartdns
########### 安装adguardhome（必选）###########
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
########### 安装ddns-go（必选）###########
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
########### luci-app-cloudflarespeedtest.git ###########
# git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git package/luci-app-cloudflarespeedtest
# mv package/luci-app-cloudflarespeedtest/applications/luci-app-cloudflarespeedtest/po/zh_Hans package/luci-app-cloudflarespeedtest/applications/luci-app-cloudflarespeedtest/po/zh-cn
