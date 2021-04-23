#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#

cd openwrt
rm -rf package/lean/luci-theme-argon #删除默认argon主题

# 修改openwrt登陆地址,把下面的192.168.2.1修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate


#修改内核版本（下面两行代码前面有#为源码默认最新5.4内核,没#为4.19内核,默认修改X86的，其他机型L大那里target/linux查看，对应修改下面的路径就好）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/ipq40xx/Makefile  #修改内核版本
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/ipq40xx/Makefile  #修改内核版本


#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件

# Add a feed source 添加更新源
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git packages https://github.com/coolsnowwolf/packages
#sed -i '$a src-git luci https://github.com/coolsnowwolf/luci
#sed -i '$a src-git routing https://git.openwrt.org/feed/routing.git
#sed -i '$a src-git telephony https://git.openwrt.org/feed/telephony.git
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages

git clone https://github.com/xiaorouji/openwrt-passwall.git package/lienol
git clone https://github.com/fw876/helloworld.git package/hellowrold
git clone https://github.com/kenzok8/openwrt-packages.git package/kenzo
git clone https://github.com/jiawm/luci-app-poweroff.git package/poweroff

rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #删除自带argon主题，安装新的argon主题
#全新的[argon-主题]此主题玩法很多,这里看说明【https://github.com/jerrykuku/luci-theme-argon/blob/18.06/README_ZH.md】
#增加可自定义登录背景功能，请自行将文件上传到/www/luci-static/argon/background 目录下，支持jpg png gif格式图片，主题将会优先显示自定义背景，多个背景为随机显示，系统默认依然为从bing获取
#增加了可以强制锁定暗色模式的功能，如果需要，请登录ssh 输入：touch /etc/dark 即可开启，关闭请输入：rm -rf /etc/dark，关闭后颜色模式为跟随系统
