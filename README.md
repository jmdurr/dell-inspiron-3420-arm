## Dell Inspiron 3420 Arm Linux Support

### Goal: 
Enough support for the sc8180xp qualcomm gen2 SOC in the dell inspiron 3420 to 
be a daily driver.

Tested with Fedora 46 rawhide kernel 7.3 live usb and internal SSD installation. 

### Steps:
- git apply kernel.patch to kernel source root
- build kernel

or 

- Compile dtc
- Patch kernel module to skip pcie phy initialization (currently build the modules or kernel with included C files)

then
- Build kernel and setup boot config
- Add kernel params to boot as defined in grub.cfg
- Obtain wifi and adsp firmware from windows install
- add adsp firmware (qcadsp8180.mbn) to initramfs /usr/lib/firmware, otherwise echo start > /sys/class/remoteproc/remoteproc(0|1)/state to start power monitoring after every boot



### Status:
- [x] keyboard
- [x] usb
- [x] touchpad
- [x] power monitor
- [x] sleep state
- [x] wifi
- [x] internal disk
- [x] rtc support
- [x] efi boot loader install
- [ ] graphics acceleration
- [ ] lid switch
- [ ] power off
- [ ] Bluetooth
- [ ] Audio
- [ ] Camera
- [ ] Microphone
- [ ] Special keys
- [x] cpu freq scaling

### General TODO: 
 - create patch instead of full module sources
 - remove debug logging from kernel modules
 - cleanup dts
 - write comprehensive setup guide


### ERRORS
Oct 16 20:00:01 fedora kernel: qcom-edp-phy aec2a00.phy: error -ENOENT: /soc@0/phy@aec2a00: Failed to get clk index: 0 (aux)
Oct 16 20:00:01 fedora kernel: qcom-edp-phy aec2a00.phy: error -ENOENT: failed to get clocks
Oct 16 20:00:01 fedora kernel: qcom-edp-phy aec2a00.phy: probe with driver qcom-edp-phy failed with error -2

Oct 16 20:00:11 fedora kernel: qcom_q6v5_pas 4080000.remoteproc: unable to resolve memory-region

Oct 16 20:00:11 fedora kernel: aux_bridge.aux_bridge aux_bridge.aux_bridge.0: error -ENODEV: failed to acquire drm_bridge

Oct 16 20:00:13 fedora kernel: synth uevent: /devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-ac: failed to send uevent
Oct 16 20:00:13 fedora udevadm[507]: qcom-battmgr-ac: Failed to write 'add' to '/sys/devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-ac/uevent': Resource tem>
Oct 16 20:00:13 fedora kernel: power_supply qcom-battmgr-ac: uevent: failed to send synthetic uevent: -11
Oct 16 20:00:13 fedora kernel: synth uevent: /devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-bat: failed to send uevent
Oct 16 20:00:13 fedora udevadm[507]: qcom-battmgr-bat: Failed to write 'add' to '/sys/devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-bat/uevent': Resource t>
Oct 16 20:00:13 fedora kernel: power_supply qcom-battmgr-bat: uevent: failed to send synthetic uevent: -11
Oct 16 20:00:13 fedora udevadm[507]: qcom-battmgr-usb: Failed to write 'add' to '/sys/devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-usb/uevent': Resource t>
Oct 16 20:00:13 fedora kernel: synth uevent: /devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-usb: failed to send uevent
Oct 16 20:00:13 fedora udevadm[507]: qcom-battmgr-wls: Failed to write 'add' to '/sys/devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-wls/uevent': Resource t>
Oct 16 20:00:13 fedora kernel: power_supply qcom-battmgr-usb: uevent: failed to send synthetic uevent: -11
Oct 16 20:00:13 fedora kernel: synth uevent: /devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-wls: failed to send uevent
Oct 16 20:00:13 fedora kernel: power_supply qcom-battmgr-wls: uevent: failed to send synthetic uevent: -11
Oct 16 20:00:14 fedora kernel: BPF: [175549] Invalid name_offset:3350057



### WARNINGS

Oct 16 20:00:01 fedora kernel: qcom-qmp-pcie-phy 1c1c000.phy: supply vdda-phy not found, using dummy regulator
Oct 16 20:00:01 fedora kernel: qcom-qmp-pcie-phy 1c1c000.phy: supply vdda-pll not found, using dummy regulator
Oct 16 20:00:01 fedora kernel: qcom-pcie 1c18000.pcie: supply vdda not found, using dummy regulator
Oct 16 20:00:01 fedora kernel: qcom-pcie 1c18000.pcie: supply vddpe-3v3 not found, using dummy regulator

Oct 16 20:00:01 fedora kernel: i2c_hid_of 0-0005: supply vdd not found, using dummy regulator
Oct 16 20:00:01 fedora kernel: i2c_hid_of 0-002c: supply vdd not found, using dummy regulator
Oct 16 20:00:01 fedora kernel: i2c_hid_of 0-0005: supply vddl not found, using dummy regulator

Oct 16 20:00:01 fedora kernel: clk: Not disabling unused clocks
Oct 16 20:00:01 fedora kernel: PM: genpd: Not disabling unused power domains

Oct 16 20:00:11 fedora kernel: qcom-qmp-combo-phy 88e8000.phy: unable to determine orientation & mode from data-lanes

Oct 16 20:00:17 fedora irqbalance[702]: thermal: failed to receive messages.
Oct 16 20:00:17 fedora irqbalance[702]: Failed to initialize thermal events.

Oct 16 20:00:18 fedora upowerd[715]: no valid voltage value found for device /sys/devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-bat, assuming 10V
Oct 16 20:00:18 fedora upowerd[715]: USB power supply /sys/devices/platform/pmic-glink/pmic_glink.power-supply.0/power_supply/qcom-battmgr-usb without usb_type property, please report


