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
sed -i 's/192.168.1.1/192.168.88.8/g' package/base-files/files/bin/config_generate

sed -i 's/root::0:0:99999:7:::/root:$1$MhPcOOTE$DOOyDUwKjP9xnoSfaczsk.:19058:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改hostname
sed -i 's/OpenWrt/XinV-2.0/g' package/base-files/files/bin/config_generate

# 添加主题
git clone darkmatter https://github.com/apollo-ng/luci-theme-darkmatter.git package/luci-theme-darkmatter
git clone neobird https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird

# 替换默认主题为 luci-theme-darkmatter
sed -i 's/luci-theme-argon/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile

sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# Add luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
