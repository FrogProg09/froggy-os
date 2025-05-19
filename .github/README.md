# Froggy OS

This is my little project, I want to create an entire os, and I think I can do it.

For guide here I use [os tutorial](https://github.com/cfenollosa/os-tutorial), we will see where this whole thing will go.
For now, I am pretty enthusiastic (06-17-2025)

To compile  I use this command:
```
nasm -f bin boot_sect.asm -o binary.bin
```
And to run it without warnings *for now*:

```
qemu-system-x86_64 -drive file=binary.bin,format=raw -boot c
```

I am on arch linux, so this is why I have to do qemu-system-x86_64 and not just qemu 
also I wounder if there is something like make file for assembly...
