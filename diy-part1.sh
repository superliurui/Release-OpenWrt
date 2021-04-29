#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）


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
git clone https://github.com/siropboy/sirpdboy-package package/sirpdboy-package
git clone https://github.com/linkease/nas-packages.git package/nas #添加ddnsto和linkease
git clone https://github.com/jiawm/luci-app-poweroff.git package/poweroff
git clone https://github.com/tty228/luci-app-serverchan.git package/serverchan
#git clone https://github.com/kenzok8/openwrt-packages.git package/kenzo


