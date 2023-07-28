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
sed -i 's/10.10.10.3/192.168.1.1/g' package/base-files/files/bin/config_generate
# git clone https://github.com/kenzok8/small-package package/small-package
git clone https://github.com/sirpdboy/sirpdboy-package package/sirpdboy-package
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
# openclash
mkdir package/others/openclash
cd package/others/openclash
git init
git remote add origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull --depth 1 origin master
git branch --set-upstream-to=origin/master master
cd ../../..
