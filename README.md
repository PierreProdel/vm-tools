# vm-tools
Helper scripts to quickly setup a VM running in VMWare with a Debian Jessie Guest OS. It works with LinuxMint LMDE (which is the Guest OS we use).
They can be used on real OS though. In that case, some aliases won't work, like all VMWare related aliases

To bootstrap install in your LMDE, use this command:

    wget https://raw.githubusercontent.com/SogetiATC/vm-tools/master/post-install/SH/.bashrc_vmtools -O setvmt.sh ; source setvmt.sh ; get-vm-tools ; rm -f setvmt.sh

Then you can use some useful aliases
+ *get-vm-tools* to update the VM tools
+ *get-vm-tools -v* to know the currently installed version (can be useful if you expect a minimum version from other scripts)
+ *mountvm* to mount your shared folders in /shares
+ *shrink* to shrink your VM size
