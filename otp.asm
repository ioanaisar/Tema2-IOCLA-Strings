%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the One Time Pad cipher
    
Start:
    mov al, [esi + ecx - 1]
    mov bl, [edi + ecx - 1]
    xor bl, al
    mov byte [edx + ecx - 1], bl
    dec ecx
    cmp ecx, 0
    jg Start

    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY