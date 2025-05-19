mov ah, 0x0e ; tty mode
mov al, 'F'
int 0x10
mov al, 'r'
int 0x10
mov al, 'o'
int 0x10
mov al, 'g'
int 0x10 
int 0x10
mov al, 'y'
int 0x10
mov al, ' '
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10

jmp $ ; jump to current address = infinite loop

; padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55 
