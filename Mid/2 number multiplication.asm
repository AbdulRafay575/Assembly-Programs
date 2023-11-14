.model small   
.stack 100h
.data
second db 0 
first db 0 
sum db 0 
plus db 0
pluss db 0
msg db 0ah,0dh,"The Answer Is :$"
.code
mov ax, @data
mov ds, ax
mov cl,10    

mov ah,1
int 21h
mov ah,0 
sub al,48
mov first,al
mul cl 
mov first,al
mov ah,1
int 21h
mov ah,0 
sub al,48
add first,al   

mov ah,1
int 21h
mov ah,0 
sub al,48
mov second,al
mul cl
mov second,al
mov ah,1
int 21h
mov ah,0 
sub al,48
add second,al 

mov ax,0
mov al,first
mul  second

mov bl,al
div cl
mov sum,ah 
mov bl,al

mov al,bl
mov ah,0
div cl 
mov plus,ah 

mov bl,al
mov ah,0
div cl 
mov pluss,ah 

mov ah, 09h
lea dx, msg
int 21h

mov dl,pluss
add dl,48
mov ah,2
int 21h

mov dl,plus
add dl,48
mov ah,2
int 21h
mov dl,sum
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

end