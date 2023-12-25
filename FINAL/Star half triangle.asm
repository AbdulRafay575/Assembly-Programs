.model small
.data 
star db "*$"
space db " $"   
nextline db 0ah,0dh,"$"
.code 
mov ax,@data
mov ds,ax

mov cx,6
mov si,cx
mov di,1
 
outer:
 
mov cx,si
innerr:  
cmp cx,1
je here
mov dx,offset space
mov ah,09h
int 21h
loop innerr 
here:

mov cx,di
inner:
mov dx,offset star
mov ah,09h
int 21h
loop inner 
 
mov dx,offset nextline
mov ah,09h
int 21h

inc di
dec si
mov cx,si
loop outer

mov ah,4ch
int 21h


end