.model small
.stack 100h
.data

msg1 db 'Enter 4-digit hex number: $';    
msg2 db 13,10, 'Binary number: $';
                                   

.code
main:
mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09h
int 21h

xor bx,bx
mov cx,4

read_hex:
mov ah,01h
int 21h

cmp al,'9'
jbe digit

sub al,'A'
add al,10
jmp store

digit:
sub al,'0'

store:
xor ah,ah
shl bx,1  
shl bx,1
shl bx,1
shl bx,1
or bx,ax
loop read_hex


lea dx,msg2
mov ah,09h
int 21h

mov cx,16
mov ah,02h

print_bin:

shl bx,1 
jc print_one

mov dl,'0'
int 21h
jmp next_bit

print_one:
mov dl,'1'
int 21h

next_bit:
loop print_bin

mov ah,4ch
int 21h

end main                                  