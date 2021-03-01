%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

Letter:
    mov al, [esi + ecx - 1];
    mov ebx, eax
    cmp al, 65
    jl No
    cmp al, 122
    jg No
    cmp al, 90
    jg Check
    cmp al, 90
    jle Put

Check:
   cmp al, 97
   jl No

Put:mov eax, ebx
    add ebx, edi
    cmp eax, 90
    jle Big
    cmp eax, 97
    jge Small 

 Do:
    mov  byte [edx + ecx - 1], bl
    dec ecx
    cmp ecx, 0
    jg Letter

je No

Big:
  cmp ebx, 90
   jg Over
  cmp ebx, 90
   jle Do

 Small:
   cmp ebx, 122
   jg Above
   cmp ebx, 122
   jle Do

Over:
     sub ebx, 90
     mov eax, 'A'
     add eax, ebx
     dec eax
     mov ebx, eax
     cmp eax, 90
     jg Above
     mov ebx, eax
    cmp ecx, 0
    jg Do
    je No

Above:
     sub ebx, 122
     mov eax, 'a'
     add eax, ebx
     dec eax
     mov ebx, eax
     cmp eax, 122
     jg Above
    mov ebx, eax
    cmp ecx, 0
    jg Do
    je No

No:
    cmp ecx, 0
    jg Do


    ;; TODO: Implement the caesar cipher

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY