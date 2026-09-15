.model small
.stack 100h
.data

msg1 db 'Enter First Number: $'
msg2 db 13,10, 'Enter Second Number: $' 
msg3 db 13,10, 'Result : $'

num1 db ?  
num2 db ?
res db ?

.code
main:

mov ax,@data
mov ds,ax

mov ah,09h
lea dx,msg1
int 21h

mov ah,01h
int 21h
sub al,30h
mov num1,al   

mov ah,09h
lea dx,msg2
int 21h

mov ah,01h
int 21h
sub al,30h
mov num2,al  


mov al,num1
sub al,num2
mov res,al


mov ah,09h
lea dx,msg3
int 21h 

mov al,res
add al,30h
mov dl,al
mov ah,02h
int 21h

mov ah,4ch
int 21h
end main
 



