Diy_lede() {
rm -rf package/lienol/luci-app-timecontrol
rm -rf package/ctcgfw/{luci-app-argon-config,luci-theme-argonv3}
rm -rf package/lean/{luci-app-netdata,luci-theme-argon,k3screenctrl}

git clone -b $REPO_BRANCH --single-branch https://github.com/281677160/openwrt-package package/danshui
svn co https://github.com/281677160/openwrt-package/branches/usb/AutoUpdate package/base-files/files/bin
chmod +x package/base-files/files/bin/* ./

git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
}

Diy_lienol() {
rm -rf package/lienol/luci-app-timecontrol
rm -rf package/ctcgfw/{luci-app-argon-config,luci-theme-argonv3}
rm -rf package/lean/{luci-app-netdata,luci-theme-argon,k3screenctrl}

git clone -b $REPO_BRANCH --single-branch https://github.com/281677160/openwrt-package package/danshui
svn co https://github.com/281677160/openwrt-package/branches/usb/AutoUpdate package/base-files/files/bin
chmod +x package/base-files/files/bin/* ./

git clone https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
}

Diy_immortalwrt() {
rm -rf package/lienol/luci-app-timecontrol
rm -rf package/ctcgfw/{luci-app-argon-config,luci-theme-argonv3}
rm -rf package/lean/{luci-app-netdata,luci-theme-argon,k3screenctrl}

git clone -b $REPO_BRANCH --single-branch https://github.com/281677160/openwrt-package package/danshui
svn co https://github.com/281677160/openwrt-package/branches/usb/AutoUpdate package/base-files/files/bin
chmod +x package/base-files/files/bin/* ./
}

######################################################################################################

Diy_lede2() {
curl -fsSL  https://raw.githubusercontent.com/xiaorouji/openwrt-passwall/main/v2ray-plugin/Makefile > package/lean/v2ray-plugin/Makefile
rm -rf {LICENSE,README,README.md}
rm -rf ./*/{LICENSE,README,README.md}
rm -rf ./*/*/{LICENSE,README,README.md}
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd
}

Diy_lienol2() {
rm -rf {LICENSE,README,README.md}
rm -rf ./*/{LICENSE,README,README.md}
rm -rf ./*/*/{LICENSE,README,README.md}
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd
}

Diy_immortalwrt2() {
rm -rf {LICENSE,README,README.md}
rm -rf ./*/{LICENSE,README,README.md}
rm -rf ./*/*/{LICENSE,README,README.md}
git clone https://github.com/openwrt-dev/po2lmo.git
pushd po2lmo
make && sudo make install
popd
}


######################################################################################################


Diy_n1() {
cd ../
svn co https://github.com/281677160/N1/trunk reform
}

Diy_n1_2() {
cd ../
cp openwrt/bin/targets/armvirt/*/*.tar.gz reform/openwrt
cd reform
sudo ./gen_openwrt -d -k latest
         
devices=("phicomm-n1" "rk3328" "s9xxx" "vplus")
cd out
for x in ${devices[*]}; do
cd $x
filename=$(ls | awk -F '.img' '{print $1}')
gzip *.img
cd ../
echo "firmware_$x=$filename" >> $GITHUB_ENV
done
cd ../../
mv -f reform/out/*/*.img.gz openwrt/bin/targets/armvirt/*
}