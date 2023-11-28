.model small   
.data
second db 0 
first db 0  
op db 0
array db 5 dup ? 
msg1 db 0ah,0dh,"Enter Number then operator and than number$"
msg db 0ah,0dh,"The Answer Is :$"  
msg3 db 0ah,0dh,"$"
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

mov ah, 09h
lea dx, msg3
int 21h

Mov ah, 01h
int 21h
mov op,al


mov ah, 09h
lea dx, msg3
int 21h

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


mov al,op

cmp al, '+'


je addition

cmp al, '*'
je Multiplication

cmp al, '-'
je Subtraction

cmp al, '/'
je Division

jmp divide
addition:   
mov ax,0
mov al,first
add al, second
jmp divide

subtraction: 
mov ax,0
mov al,first
sub  al,second
jmp divide
 
division:
mov ax,0
mov al,first
div  second 
jmp divide

multiplication:
mov ax,0
mov al,first
mul  second 
jmp divide



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