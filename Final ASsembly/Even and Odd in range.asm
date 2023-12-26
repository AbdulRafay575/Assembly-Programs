.model small   
.stack 100h
.data
array db 5 dup (?) 
odd db 30 dup (?)
ten dw 10
divi dw 2 
enter db 13
lp dw ?
starting dw ? 
ending dw ?
mull dw 0    
mg db 0ah,0dh,"Enter Starting Number:$"  
endd db 0ah,0dh,"Enter Ending Number:$" 
msg1 db 0ah,0dh,"Even numbers are :$"    
space db "  $"
msg3 db "Odd Numbers are:$" 
msg2 db 0ah,0dh,"Wanna Check Another Number Range (y,n) ?:$"
.code
mov ax, @data
mov ds, ax   
startt:
mov bx,0
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
mov starting,bx



mov dx,offset endd
mov ah,09h
int 21h 
mov bx,0
mov si, 0 
start1:
mov ah, 1
int 21h 
cmp al, enter
je done1
sub al, 48 
mov ah,0
mov [array+si],al
inc si
jmp start1

;multiply logic here
multiply1:
mul ten
jmp there1
 
done1:  
mov mull, si 
mov di, 0
mov ax, 0
mov si, 0 
mov cx, 0
mov cx,mull     
;adding string input
addup1: 
mov ax,0
mov al,[array+di]
mov lp,cx
again1:
inc si
;mov bx,ax
cmp cx,1
jG multiply1 
there1:
loop again1
add bx,ax
inc di
mov cx,lp
loop addup1 
mov ending,bx

mov si,0
mov dx,offset msg1
mov ah,09h
int 21h 


mov di,0
there3:
mov ax,starting
mov bx,starting 
mov si,ending  

cmp ax,ending  ;logic
jg programend
             

mov divi,2 
looop:
mov dx,0   
mov ax,starting
div divi
cmp dx,1
je oddd

        
mov dx,offset space
mov ah,09h
int 21h 


mov si,0
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
inc starting
jmp there3
oddd:
mov bx,0
mov bx,starting
mov [odd+di],bl  
inc di
inc starting
jmp there3


programend:
mov dx,offset msg1
mov ah,09h
int 21h 

mov di,0

odnum: 
mov dx,offset space
mov ah,09h
int 21h 

mov bx,0 
mov bl,[odd+di] 
mov si,0
output2:
inc si
mov dx,0
mov ax,bx
div ten
mov bx,ax
add dx,48
push dx 
cmp bx,0
je done3
jmp output2
done3:

mov cx,si 
lopp:
pop dx 
mov ah,2
int 21h
inc si
loop lopp

inc di
mov bl,[odd+di]
cmp bl,0
je done5
jmp odnum

done5:
mov ah, 4ch
int 21h


end