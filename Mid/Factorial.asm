.model small   
.stack 100h
.data
array db 5 dup (?)
ten dw 10 
enter db 13
lp dw ?
fac dw ?
mull dw 0    
mg db 0ah,0dh,"Enter Number:$" 
msg1 db 0ah,0dh,"Factorial of the Number is :$"  
msg2 db 0ah,0dh,"Wanna Calculate Another Number Factorial (y,n) ?:$"
.code
mov ax, @data
mov ds, ax   
startt:
mov dx,offset mg
mov ah,09h
int 21h 

mov si, 0 
start:
mov ah, 1
int 21h 
cmp al, enter
je done
sub al, 48 
mov ah,0
mov [array+si],al
inc si
jmp start

;multiply logic here
multiply:
mul ten
jmp there
 
done:  
mov mull, si 
mov di, 0
mov ax, 0
mov si, 0 
mov cx, 0
mov cx,mull     
;adding string input
addup: 
mov ax,0
mov al,[array+di]
mov lp,cx
again:
inc si
;mov bx,ax
cmp cx,1
jG multiply 
there:
loop again
add bx,ax
inc di
mov cx,lp
loop addup

cmp bx,0
je disp
;factorial logic
mov fac,bx
mov si,bx 
dec si
factorial: 
cmp si,0
je disp
mov ax,fac
mul si  
dec si   
mov fac,ax
jmp factorial

;outout funtions start from here
disp:
mov bx,fac 
mov si,0
mov dx,offset msg1
mov ah,09h
int 21h 

output:
inc si
mov dx,0
mov ax,bx
div ten
mov bx,ax
add dx,48
push dx 
cmp bx,0
je done2
jmp output
done2:

mov cx,si 
lop:
pop dx 
mov ah,2
int 21h
inc si
loop lop

mov dx,offset msg2
mov ah,09h
int 21h 
mov ah, 1
int 21h 
cmp al,'y'
je startt 

mov ah, 4ch
int 21h


end