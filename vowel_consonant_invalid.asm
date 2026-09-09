.model small
.stack 100h
.data

msg1 db 'Enter a Word to check: $';    
msg2 db 13,10, 'Vowel. $';  
msg3 db 13,10, 'Consonant. $';
msg4 db 13,10, 'Invalid. $';

.code
main:

mov ax,@data
mov ds,ax

mov ah,09h
lea dx,msg1
int 21h

mov ah,01h
int 21h

cmp al,'A'
jl invalid 
cmp al,'Z'
jg invalid 

cmp al,'A'
je vowel

cmp al,'E'
je vowel

cmp al,'I'
je vowel

cmp al,'O'
je vowel

cmp al,'U'
je vowel   

jmp consonant

vowel:
    lea dx,msg2
    mov ah,09h
    int 21h
    jmp exit   
    
consonant:
    lea dx,msg3
    mov ah,09h
    int 21h
    jmp exit
    
invalid:
    lea dx,msg4
    mov ah,09h
    int 21h

exit:
    mov ah,4ch
    int 21h
    
end main

