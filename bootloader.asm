 ; bootloader.asm
BITS 16
org 0x7C00

start:
   cli                     ; Clear interrupts
   xor ax, ax
   mov ds, ax
   mov es, ax

   ; Load kernel from disk (assuming kernel is right after bootloader)
   ; Read sectors into 0x1000 (just an example)
   mov si, kernel_load_addr
   mov bx, 0x1000        ; Segment address for loading kernel
   mov dl, 0x80          ; First hard disk
   mov ah, 0x02          ; BIOS read sectors
   mov al, 4             ; Number of sectors to read
   mov ch, 0             ; Cylinder 0
   mov cl, 2             ; Sector 2 (sector 1 is bootloader)
   mov dh, 0             ; Head 0
   int 0x13
   jc disk_error

   ; Jump to kernel (segment:offset)
   jmp 0x1000:0x0000

disk_error:
   ; Print error message
   mov si, disk_error_msg
   call print_string
hang:
   jmp hang

print_string:
   mov ah, 0x0E
.next_char:
   lodsb
   cmp al, 0
   je .done
   int 0x10
   jmp .next_char
.done:
   ret

kernel_load_addr:
   dw 0

; Messages
kernel_load_msg:
    db 'Loading kernel...', 0
disk_error_msg:
    db 'Disk read error!', 0

times 510 - ($ - $$) db 0
dw 0xAA55
