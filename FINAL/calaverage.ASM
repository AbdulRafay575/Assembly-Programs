.model small

.data
array db 5 dup (?)
result db ?
msg1 db "Enter 5 Numbers: $"
msg2 db 0ah, 0dh, "Average is: $"

.code
mov ax, @data
mov ds, ax

mov si, 0
mov cx, 5

;display input message
mov ah, 09h
lea dx, msg1
int 21h

input_loop:
mov ah, 01h
int 21h
sub al, '0'
mov [array + si], al
inc si
loop input_loop

;calculate average now
mov al, 0
mov si, 0;
mov cx, 5

cal_avg:
add al, [array + si]
inc si
loop cal_avg

;divide by 5
mov ah, 0
mov bl, 5
div bl
mov [result], al

;display average
mov ah, 09h
lea dx, msg2
int 21h

mov dl, al
add dl, '0'
mov ah, 02h
int 21h

mov ah, 4ch
int 21h

end
