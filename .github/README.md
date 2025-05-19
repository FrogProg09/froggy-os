# Froggy OS

This is my little project, I want to create an entire os, and I think I can do it.

For guide here I use [os tutorial](https://github.com/cfenollosa/os-tutorial), we will see where this whole thing will go.
For now, I am pretty enthusiastic (06-17-2025)

To compile without warnings *for now* I use this command:

```
qemu-system-x86_64 -drive file=boot_sect_hello.bin,format=raw -boot c
```

I am on arch linux, so this is why I have to do qemu-system-x86_64 and not just qemu 
also I wounder if there is something like make file for assembly...
