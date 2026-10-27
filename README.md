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
- [ ] cpu power states
- [ ] Bluetooth
- [ ] Audio
- [ ] Camera
- [ ] Microphone
- [ ] Special keys
- [ ] cpu freq scaling

### General TODO: 
 - create patch instead of full module sources
 - remove debug logging from kernel modules
 - cleanup dts
 - write comprehensive setup guide



