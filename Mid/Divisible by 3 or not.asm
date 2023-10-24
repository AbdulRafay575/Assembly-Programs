.model small
.stack 100h
.data
msg1 db "Enter the Range : $"
start db 0
end db 0 
nextline db 0ah,0dh,"Divisible by 3 are : $"
msg3 db " $"
msg2 db 0ah, 0dh, "Not Divisible by 3 are : $"
num db 3 
save db 0
.code
mov ax, @data
mov ds, ax

mov ah, 09h
lea dx, msg1
int 21h

mov ah,1
int 21h 
sub al,48
mov start,al

mov dx,offset msg3
mov ah,09h
int 21h 

mov ah,1
int 21h 
sub al,48
mov end,al 

mov dx,offset msg2
mov ah,09h
int 21h

mov cx,0
mov cl,end
mov bl,start
cmp bl,end
JG done 


again: 

mov ah,0
mov al,bl
div num 
mov save,ah
cmp ah,0
JG print 
cmp ah,0
je notprint
there:


inc bl 
cmp bl,end
JG done
jmp again 

done: 

mov dx,offset nextline
mov ah,09h
int 21h
mov dx,0

pop bx 
cmp bl,59
JG sure
mov al,bl 
mov dl,bl
add dl,48
mov ah,2 
int 21h

pop bx
cmp bl,59
JG sure 
mov al,bl 
mov dl,bl
add dl,48
mov ah,2 
int 21h


sure: 
mov ah, 4ch
int 21h
;printing function to print number that divide by 3
print proc 
mov dl,bl
add dl,48
mov ah,2
int 21h
jmp there    
endp print 

notprint proc
push bx 
;mov dl,bl
;add dl,48
;mov ah,2
;int 21h
jmp there    
endp notprint


end