## Dell Inpsiron 3420 Arm Linux Support

Tested with Fedora 46 rawhide kernel 7.3 live usb. The DTS still needs cleanup and
I am still working through various support and returning as much kernel
functionality as possible.

### Steps:
- Compile dtc
- Add kernel params to boot
- Patch kernel module to skip pcie phy initialization (currently build the module or kernel with included C file)
- Obtain wifi and adsp firmware from windows install

### Status:
- [x] keyboard
- [x] usb
- [x] touchpad
- [x] power monitor
- [x] sleep state
- [x] wifi
- [x] internal disk
- [ ] graphics acceleration
- [ ] lid switch
- [ ] power off
- [ ] cpu power states

### General TODO: 
 - create patch, remove debug logging from kernel module
 - cleanup dts 



