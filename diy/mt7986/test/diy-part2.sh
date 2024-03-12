#!/bin/bash

del_data="
./feeds/luci/applications/luci-app-passwall
./feeds/luci/applications/luci-app-smartdns
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
./feeds/packages/net/smartdns
./feeds/packages/net/ipt2socks
./feeds/packages/net/xray-core
./package/network/utils/iptables
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
pushd feeds/packages/lang
rm -rf golang && svn co https://github.com/sbwml/packages_lang_golang/tree/22.x/golang
popd
