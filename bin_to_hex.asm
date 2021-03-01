%include "io.mac"

section .text
    global bin_to_hex
    extern printf
section .data
    nr DB 0
    i DD 0
    power DB 0
    position DD 0
    hexa TIMES 8 DB 11
    lenght DD 0

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY
    mov byte[nr], 0
    mov dword[i], 0
    mov ebx, 1
    mov byte[power], 1
    mov dword[position], 1
    mov dword[lenght], 1

Start:
    mov byte[nr], 0
    mov dword[i], 0
    mov byte[power], 1
    cmp ecx, 0
    jle End
    cmp ecx, 0
    jg Construct

Calculate:
        cmp dword[i], 0
        je End
        mov al, byte[nr]
        push ecx
        mov ecx, dword[position]
        cmp al, 9
        ja Letter
Number:
        add al, '0'
        inc dword[lenght]
        mov  byte [hexa + ecx - 1], al
        jmp Next
Letter:
        mov bl, al
        sub bl,10
        mov al, 'A'
        add al, bl
        mov  byte [hexa + ecx - 1], al
        inc dword[lenght]

Next:   
        inc dword[position]
        pop ecx
        
         cmp ecx, 0
        jle End
        cmp ecx, 0
        jg Start


Construct:
    push edx
     mov bl, byte[power]
     cmp ecx, 0
     jg Go_on
     cmp ecx, 0
     jle End

Go_on:  
     mov al, [esi + ecx - 1];
     sub al, '0'
     mul bl
     add byte[nr], al
     mov al, byte[power]
     mov ebx, 2
     mul ebx
     mov byte[power], al
     pop edx
     inc dword[i]
     dec ecx
     cmp ecx, 0
     jle Calculate
     cmp dword[i], 4
     jl Construct
     cmp dword[i],4
     je Calculate



End:
    mov ecx, 1
    dec dword[lenght]
    mov ebx, dword[lenght]
Move:
    mov al, byte [hexa + ebx - 1]
    dec ebx
    mov  byte [edx + ecx - 1], al
    inc ecx
    cmp ebx, 0
    jg Move

    mov al, 0x0A
    mov  byte [edx + ecx - 1], al


    ;; TODO: Implement bin to hex

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY