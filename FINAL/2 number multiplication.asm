.model small   
.stack 100h
.data
second db 0 
first db 0 
array db 5 dup ? 
msg1 db 0ah,0dh,"number who's multiplication is less than 1000 :$"
msg db 0ah,0dh,"The Answer Is :$"
.code
mov ax, @data
mov ds, ax
mov cl,10    
mov ah, 09h
lea dx, msg1
int 21h
        

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
mov si,0 
mov cx,10

divide:
mov bl,al
div cl
mov [array+si],ah
inc si  
mov bl,al
mov ah,0
cmp bl,0
je output
jmp divide

output:

mov ah, 09h
lea dx, msg
int 21h
        
outputnumber:       
dec si
mov dl,[array+si]
add dl,48
mov ah,2
int 21h

cmp si,0
je done
jmp outputnumber

done:
mov ah,4ch
int 21h

end