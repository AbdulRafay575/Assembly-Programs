.model small
.stack 100h
.data
array db 5 dup (?)

.code
mov ax,@data
mov ds,ax
mov si,0
mov cx,4
input: 
mov ah,1
int 21h   
sub al,48
mov [array+si],al
inc si
loop input

mov ax,0
mov si,0
mov cx,4
mov bl,[array+si]
lopp:
mov al,[array+si]
cmp bl,al
JL large

again: 
inc si
loop lopp

mov dx,bx
add dx,48
mov ah,2

int 21h

mov ah,4ch
int 21h

large:
mov bl,[array+si]
jmp again

end
