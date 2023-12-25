.model small   
.stack 100h
.data
array db 5 dup (?)
ten dw 10 
enter db 13
lp dw ?
mull dw 0    
mg db "Enter The Number:$" 
msg1 db 0ah,0dh,"Your Number is :$"
.code
mov ax, @data
mov ds, ax 
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

mov cx,mull
mov dx,offset msg1
mov ah,09h
int 21h 
mov si,cx

mov [array+0],48
mov [array+1],48

output:
dec si 
mov dx,0
mov ax,bx
div ten
mov bx,ax
add dx,48
mov [array+si],dl 

loop output

mov cx,0
mov cx,mull
mov si,0 
lop:
mov dl,[array+si] 
mov ah,2
int 21h
inc si
loop lop

mov ah, 4ch
int 21h

multiply:
mul ten
jmp there
end