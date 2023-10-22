.model small 
.stack 100h 
.data
msg db "*$"
msg1 db 0ah, 0dh, "$" 
msg2 db "$" 
.code
mov ax, @data 
mov ds, ax

mov cx,1
mov di,1
mov si,5 
outerr:
mov cx,di 
outer:
Mov dx, offset msg2 
mov ah, 09h 
int 21h
loop outer 
inc di
mov cx,si
start:
Mov dx, offset msg
mov ah, 09h
int 21h
loop start
Mov dx, offset msg1
mov ah, 09h
int 21h
dec si
cmp si,0 
je done 
jmp outerr
done:
mov ah, 4ch 
int 21h

end
