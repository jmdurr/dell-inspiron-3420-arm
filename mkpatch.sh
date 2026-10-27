#!/bin/sh

kernsrc="$1"
kernconf="$2"
PWD=`pwd`
files="drivers/firmware/qcom/qcom_scm.c drivers/phy/qualcomm/phy-qcom-qmp-pcie.c"
newfiles="arch/arm64/boot/dts/qcom/sc8180x-dell-inspiron-3420.dts"
echo > kernel.patch
for file in $files
do 
	git diff --no-index --relative="$kernsrc" "$kernsrc/$file" "$file" | sed -E "s#$kernsrc##g" >> kernel.patch
done

for file in $newfiles
do
	git diff --no-index --relative="$kernsrc" /dev/null "$file" | sed -E "s#$kernsrc##g" >> kernel.patch
done

cp kernel-local "$kernconf/"
cp kernel.patch "$kernconf/"

# Patch kernel config to contain default boot options?
# CONFIG_CMDLINE_EXTEND=cpuidle.off=1 pd_ignore_unused clk_ignore_unused module_blacklist=drm,drm_kvm_helper,drm_display_helper,drm_aux_bridge,simpledrm,msm console=tty0 loglevel=8 ignore_loglevel rd.plymouth=0 plymouth.enable=0 systemd.mask=smartd.service


