[org 0x7c00] ; tell the assembler that our offset is bootsector code
    mov bp, 0x8000 ; set the stack safely away from us
    mov sp, bp

    mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x09000
    mov dh, 2 ; read 2 sectors
    ; the bios sets 'dl' for our boot disk number
    ; if you have trouble, use the '-fda' flag: 'qemu -fda file.bin'
    call disk_load

    mov dx, [0x9000] ; retrieve the first loaded word, 0xdada
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512] ; first word from second loaded sector, 0xface
    call print_hex

    call print_nl

    mov bx, HELLO
    call print

    call print_nl

    mov bx, BYE
    call print

    call print_nl

    jmp $

; remember to include subroutines below the hang
%include "headers/boot_sect_print.asm"
%include "headers/boot_sect_print_hex.asm"
%include "headers/boot_sect_disk.asm"

; data
HELLO: db 'Greetings, it is Froggy OS', 0

BYE: db 'Goodbye, come back soon...', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55

; boot sector = sector 1 of cyl 0 of head 0 of hdd 0
; from now on = sector 2 ...
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes
