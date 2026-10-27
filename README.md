## Dell Inspiron 3420 Arm Linux Support

Tested with Fedora 46 rawhide kernel 7.3 live usb. The DTS still needs cleanup and
I am still working through various support and returning as much kernel
functionality as possible.

### Steps:
- apply dtsmake.patch to linux kernel source tree 7.3

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

### General TODO: 
 - create patch instead of full module sources
 - remove debug logging from kernel modules
 - cleanup dts
 - write comprehensive setup guide



