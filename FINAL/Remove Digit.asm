.model small
.stack 100h
.data 
sum db 0
rem dw 0 
msg db "Enter a String: $"
msg1 db 0ah,0dh,"The Answer is: $"
array db 15 dup (?)

.code
mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,09h
int 21h


mov si,0
mov cx,15
input: 
mov ah,1
int 21h   
mov [array+si],al
inc si
loop input

mov bl,'9'
mov cx,15
mov di,0
lopp:
mov al,[array+di]
cmp bl,al
JG digit
again:
inc di
loop lopp

mov si,0
mov cx,15 
mov dx,offset msg1
mov ah,09h
int 21h

output:
mov dl,[array+si]
cmp dl,0
je hi
mov ah,2
int 21h
hi:
inc si   
loop output  


mov ah,4ch
int 21h

digit:
 
mov [array+di],0 
jmp again



end