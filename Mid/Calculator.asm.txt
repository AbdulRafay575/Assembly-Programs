; This code was developed to help out in simple operation such as addition, subtraction, multiplication, and devision.
.model small 
.stack 100h
.data
; Specify the required variables
msg db "Specify an operation between (+ - * /) : $"
msg1 db 0ah,0dh,"Enter a number $" 
msg2 db 0ah,0dh,"Invalid Operation !!!!!$"  
res db 0ah,0dh,"The Answer Is : $"
.code
;Load your data segment
mov ax, @data
mov ds, ax

; Tell the user to select an operation
Mov dx, offset msg
mov ah, 09h
int 21h

;Get an operation from the user
Mov ah, 01h
int 21h

;Check which operation the user has selected
cmp al, '+'
;call TLine
; Jump to the edition segment if user pressed +
je addtion

cmp al, '*'
je Multiply

cmp al, '-'
je Subtraction

cmp al, '/'
je Division

; Terminate the program 
mov dx, offset msg2
mov ah, 09h
int 21h

Done:  

mov ah, 4ch
int 21h


; Segment that contains the addition logic
Addtion:

; Tell the user to give us the first number
call printMsg

; Take first number
mov ah, 01h
int 21h

;Subtract ascii and save the given number in bl
mov bl, al
sub bl, 30h
call TLine

; Tell the user to input a number
call printMsg

; Get the second number
mov ah, 01h
int 21h

;Subtract asciii
sub al, 30h

;Add the numbers
add al, bl

;Move the number to dl to print it out.
mov cl, al
call TLine
mov dl, cl
;Add ascii to the number.
add dl, 30h

; Let us print.
mov ah, 02h
int 21h
jmp done




Subtraction:

; Tell the user to give us the first number
call printMsg

; Take first number
mov ah, 01h
int 21h

;Subtract ascii and save the given number in bl
mov bl, al
sub bl, 30h
call TLine

; Tell the user to input a number
call printMsg

; Get the second number
mov ah, 01h
int 21h

;Subtract asciii
sub al, 30h
mov cl,al
mov al,bl

;subtract the numbers
sub al, cl

;Move the number to dl to print it out.
mov cl, al
call TLine
mov dl, cl
;Add ascii to the number.
add dl, 30h

; Let us print.
mov ah, 02h
int 21h
jmp done





Multiply:

call printMsg
Mov ah, 01h
int 21h
Mov bl, al
sub bl, 30h

call printMsg
mov ah, 01h
int 21h
Mov cl, al 
sub cl, 30h
Mov ax, 0
Mov al, cl
Mul bx

Mov dx, ax
Add dx, 30h 
mov cx,dx


call printresult

mov dx,cx
mov ah, 02h
int 21h
jmp done


Division:

call printMsg
Mov ah, 01h
int 21h
Mov bl, al
sub bl, 30h

call printMsg
mov ah, 01h
int 21h
Mov cl, al
sub cl, 30h

Mov ax, 0
Mov al, bl
div cl

Mov dl, al
Add dl, 30h 
mov cl,dl


call printresult

mov dl,cl

mov ah, 02h
int 21h
jmp done




Tline proc
;push dl
Mov dl, 0ah
mov ah, 02h
int 21h
;pop dl
ret
Tline endp

printMsg proc
mov dx, offset msg1
mov ah, 09h
int 21h
ret
endp printMsg


printresult proc
mov dx, offset res
mov ah, 09h
int 21h
ret
endp printresult



end
