.model small   
.stack 100h
.data
msg1 db "Enter The First Number (0 to 255) :$"  
msg2 db 0ah,0dh,"Enter The Second Number (0 to 255) :$"
mull dw 100
second dw 0 
first dw 0 
sum dw 0 
plus db 0
extra db 0
msg db 0ah,0dh,"Result :$"
.code
mov ax, @data
mov ds, ax 

mov ah, 09h
lea dx, msg1
int 21h

mov cl,100    
mov ah,1
int 21h
mov ah,0 
sub al,48
mul mull
mov first,ax 
mov ax,0
mov ah,1
int 21h
mov ah,0 
sub al,48
mov cl,10
mul cl
add first,ax 
mov ax,first
mov ah,1
int 21h
mov ah,0 
sub al,48
add first,ax


mov ah, 09h
lea dx, msg2
int 21h

;
mov cl,100    

mov ah,1
int 21h
mov ah,0 
sub al,48
mul mull
mov second,ax 

mov ax,0
mov ah,1
int 21h
mov ah,0 
sub al,48
mov cl,10
mul cl
add second,ax 
mov ax,second

mov ah,1
int 21h
mov ah,0 
sub al,48
add second,ax

mov ax,second
mov ah,2
int 21h   
;



mov bx,first 
mov cx,0
mov cx,second
add  bx,cx
  


mov cx,0
mov cx,10
mov ax,0
mov ax,bx
div cx
mov sum,dx 
mov bx,ax

mov ah,0
mov ax,bx
mov cl,10
div cl 
mov plus,ah

mov extra,al 

mov ah, 09h
lea dx, msg
int 21h

mov dl,extra
add dl,48
mov ah,2
int 21h  
mov dl,plus
add dl,48
mov ah,2
int 21h
mov dx,sum
add dx,48
mov ah,2
int 21h 




done:
mov ah,4ch
int 21h

end