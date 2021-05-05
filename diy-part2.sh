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
# 修改openwrt登陆地址,把下面的192.168.2.1修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#修改cpu限制为管控模式下
sed -i 's/system/control/g' package/sirpdboy-package/luci-app-cpulimit/luasrc/controller/cpulimit.lua
#修改定时设置为管控模式下
sed -i 's/system/control/g' package/sirpdboy-package/luci-app-autotimeset/luasrc/controller/autotimeset.lua
#修改IP限速（eqos）为管控模式下
sed -i 's/network/control/g' package/sirpdboy-package/luci-app-eqos/luasrc/controller/eqos.lua 
#修改网络唤醒为管控模式下
sed -i 's/services/control/g' feeds/luci/applications/luci-app-wol/luasrc/controller/wol.lua 
#修改磁盘休眠为管控模式下
sed -i 's/services/control/g' feeds/luci/applications/luci-app-hd-idle/luasrc/controller/hd_idle.lua 
