.model small
.stack 100h
.data

msg1 db 'Enter  bin number: $';    
msg2 db 13,10, 'Hexa: $';
                                   

.code
main:
mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09h
int 21h

xor bx,bx  

input:
mov ah,01h
int 21h

cmp al,0dh
je display

sub al,'0'
shl bx,1
xor ah,ah
or bx,ax
jmp input

display: 
lea dx,msg2
mov ah,09h
int 21h 

mov cx,4

hex_loop:
mov dl,bh
shr dl,4
cmp dl,9
jbe digit
add dl,7

digit:
add dl,'0'
mov ah,02h
int 21h

shl bx,1    
shl bx,1
shl bx,1
shl bx,1

loop hex_loop

mov ah,4ch
int 21h

end main



                                 