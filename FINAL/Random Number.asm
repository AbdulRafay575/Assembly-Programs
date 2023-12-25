.model small
.data

.code
    mov ax, @data
    mov ds, ax
    
    mov ah,0
     int 1ah
     
     mov ax,dx
     mov dx,0
     mov bx,10
     div bx
    
    mov ah,4ch
    int 21h

end
