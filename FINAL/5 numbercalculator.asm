.model small   
.stack 100h
.data

array1 db 6 dup (?) 
array2 db 6 dup (?) 
tem db 10 
first dw 0  
second dw 0   
nextline db 0ah,0dh,"Enter the operator :$"     
mg db "Enter the First Number:$" 
msg1 db 0ah,0dh,"Enter the Second Number :$"
answer db 0ah,0dh,"The Answer is:$"
.code 

mov ax, @data
mov ds, ax

mov dx,offset mg      ;Input message 
mov ah,09h
int 21h 


mov si, 4 
start1:               ;input the first Number
mov ah, 1
int 21h 
sub al, 48 
mov ah,0
mov [array1+si],al
cmp si,0
je  In1 
dec si
jmp start1    
  
  
In1:
mov dx,offset msg1    ;input message 
mov ah,09h
int 21h  

mov si, 4 
start2:               ;input the Second Number
mov ah, 1
int 21h 
sub al, 48 
mov ah,0
mov [array2+si],al
 
cmp si,0
je  In2  
dec si
jmp start2 

In2: 
mov si,0
mov cx,10 
mov dx,offset nextline    ;input message 
mov ah,09h
int 21h 

mov ah,1
int 21h

cmp al,'+'
je Addition

cmp al,'-'
je Subtraction 
cmp al,'/'
je Division

;Addition logic start from here
Addition:
mov ax,0
mov al,[array1+si]
add al,[array2+si]
cmp al,9
JG nextmaadd
mov [array1+si],al
nextnumber:
inc si
cmp si,5
je display
jmp Addition

nextmaadd:
add [array1+si+1],1 
div cl
mov [array1+si],ah
jmp nextnumber
;Addition logic end here


;Subraction Logic Start from here
Subtraction:
mov ax,0
mov al,[array1+si]
mov bl,[array2+si]  
cmp bl,al
JG nextsaminus

minus:
sub al,bl
mov [array1+si],al  
inc si
cmp si,5
je display
jmp Subtraction  

nextsaminus:
sub [array1+si+1],1
add al,10
jmp minus
;Subtraction logic end here

;Division logic start from here
Division:  

mov si,4
divv:
mov ax,0
mov cx,2
mov al,[array1+si]
div cl
mov [array1+si],al
cmp ah,0
je next1
add [array1+si-1],10 
next1: 
mov bx,10
mov cx,si 
mov ah,0

loopp:  
mul bx 
cmp cx,0
dec cx
JG  loopp

add first,ax
cmp si,0  
dec si
jL nextdiv
jmp divv 

;second array 
nextdiv:
mov si,4
divv2:
mov ax,0
mov cx,2
mov al,[array2+si]
div cl
mov [array2+si],al
cmp ah,0
je next2
add [array2+si-1],10 
next2:         
mov bx,10
mov cx,si 
mov ah,0

looppp:  
mul bx 
cmp cx,0
dec cx
JG  looppp

add second,ax
cmp si,0  
dec si
jL divide
jmp divv2 


divide: 
mov dx,offset answer      ;Output message 
mov ah,09h
int 21h


mov dx,0
mov ax,0
mov ax,first 
cmp ax,second
JG done
div second

mov dx,ax 
add dl,48
mov ah,2
int 21h
jmp done:

;Division logic end here


display:  
mov ax,first 
mov bx,second
mov dx,offset answer      ;Output message 
mov ah,09h
int 21h
mov si,5 
mov dl,[array1+si]
cmp dl,0
je there  
add dl, 48
mov ah,2
int 21h
there:
mov si, 4
output:               ;Displaying input Number 1
mov dx,0
mov dl,[array1+si] 
add dl, 48 
mov ah, 2
int 21h 
cmp si,0  
je  done 
dec si 
jmp output 
done:

mov ah, 4ch
int 21h

end