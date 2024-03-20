#!/bin/bash

del_data="
./feeds/luci/applications/luci-app-passwall
./feeds/luci/applications/luci-app-smartdns
./feeds/packages/net/smartdns
./feeds/packages/net/brook
./feeds/packages/net/dns2socks
./feeds/packages/net/microsocks
./feeds/packages/net/pdnsd-alt
./feeds/packages/net/v2ray-geodata
./feeds/packages/net/naiveproxy
./feeds/packages/net/shadowsocks-rust
./feeds/packages/net/shadowsocksr-libev
./feeds/packages/net/simple-obfs
./feeds/packages/net/sing-box
./feeds/packages/net/tcping
./feeds/packages/net/trojan
./feeds/packages/net/trojan-go
./feeds/packages/net/trojan-plus
./feeds/packages/net/v2ray-core
./feeds/packages/net/v2ray-plugin
./feeds/packages/net/xray-plugin
./feeds/packages/net/chinadns-ng
./feeds/packages/net/dns2tcp
./feeds/packages/net/tcping
./feeds/packages/net/hysteria
./feeds/packages/net/tuic-client
./feeds/packages/devel/gn
./feeds/packages/net/ipt2socks
./feeds/packages/net/xray-core
"

for cmd in $del_data;
do
 rm -rf $cmd
 echo "Deleted $cmd"
done


##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

########### 更新内置的golang版本 ###########
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

########### 更新smartdns版本 ###########
SMARTDNS_VER=$(echo -n `curl -sL https://api.github.com/repos/pymumu/smartdns/commits | jq .[0].commit.committer.date | awk -F "T" '{print $1}' | sed 's/\"//g' | sed 's/\-/\./g'`)
SMAERTDNS_SHA=$(echo -n `curl -sL https://api.github.com/repos/pymumu/smartdns/commits | jq .[0].sha | sed 's/\"//g'`)
sed -i '/PKG_MIRROR_HASH:=/d' package/smartdns/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:='"$SMARTDNS_VER"'/g' package/smartdns/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:='"$SMAERTDNS_SHA"'/g' package/smartdns/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:='"$SMARTDNS_VER"'/g' package/luci-app-smartdns/Makefile
sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' package/luci-app-smartdns/Makefile
########### 更新passwall rust 依赖 ###########
# git clone https://github.com/immortalwrt/packages feeds/im-packages 
# cp -r feeds/im-packages/lang/rust feeds/packages/lang
# rm -rf feeds/im-packages
