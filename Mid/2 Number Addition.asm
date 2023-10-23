.model small   
.stack 100h
.data
second db 0 
first db 0 
sum db 0 
plus db 0
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
;add al,48 
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
;add al,48 
mov second,al
mov ah,1
int 21h
mov ah,0 
sub al,48
add second,al 

mov bl,first
add  bl,second
  

mov ax,0
mov al,bl
div cl
mov sum,ah 
mov bh,al

mov al,bh
mov ah,0
div cl 
mov plus,ah 

mov ah, 09h
lea dx, msg
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