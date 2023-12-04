            .model small   
.data
second dw 0 
first dw 0  
op db 0 
ten dw 10 
hundred dw 100
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
mov ah,0 
mul hundred 
mov first,ax
mov ah,1
int 21h
mov ah,0 
sub al,48
mov ah,0
mul ten   
add first,ax
mov ah,1
int 21h
mov ah,0 
sub al,48
mov ah,0
add first,ax   

mov ax,first
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
mov ah,0
mul hundred
mov second,ax
mov ah,1
int 21h
mov ah,0 
sub al,48
mul ten  
mov ah,0
add second,ax  
mov ah,1
int 21h
mov ah,0 
sub al,48    
mov ah,0
add second,ax  

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
mov ax,first
add ax, second
jmp divide

subtraction: 
mov ax,0
mov ax,first
sub  ax,second
jmp divide
 
division:
mov ax,0
mov ax,first
div  second 
jmp divide

multiplication:
mov ax,0
mov ax,first
mul  second 
jmp divide



mov si,0 
mov cx,10

divide: 
mov bx,0

mov dx,0 
dividee:
mov bx,ax
div ten
mov [array+si],dl
inc si  
mov bx,ax
mov dx,0
cmp bx,0
je output
jmp dividee

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