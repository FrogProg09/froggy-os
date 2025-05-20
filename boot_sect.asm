mov ah, 0x0e ; tty mode

mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

; to show how the stack grows downwards
; mov al, [0x7ffe] ; 0x8000 - 2
; int 0x10

pop bx
mov al, bl
int 0x10 ; prints C

pop bx
mov al, bl
int 0x10 ; prints B

pop bx
mov al, bl
int 0x10 ; prints A

jmp $

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55
