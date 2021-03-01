%include "io.mac"

section .text
    global my_strstr
    extern printf

section .data
    string DD 0
    substring DD 0
    cnt DD 0
    ok DD 0

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    mov [string], ecx
    mov [substring], edx
    mov ecx, 1
    mov dword[cnt], 1
    mov dword[ok], 0

Start:
     mov al, [esi + ecx - 1];
     push ecx
     mov ecx, [cnt]
     mov dl, [ebx + ecx -1 ]
     pop ecx
     cmp eax, edx
     je Do
     inc ecx
     cmp eax, edx
     je Do
     cmp ecx, [string]
     jle Start

    
Do:
    mov eax, dword[substring]
    cmp dword[cnt], eax
    je Yes
    inc ecx
    inc dword[cnt]
    
    mov al, [esi + ecx - 1];
    push ecx
    mov ecx, [cnt]
    mov dl, [ebx + ecx -1 ]
    pop ecx
    cmp eax, edx
    je Do
    cmp ecx, [string]
    jl Restart

Restart: 
    mov dword[cnt], 1
    cmp ecx, [string]
    jle Start
    jge End

Yes:
    sub ecx, dword[substring]
    mov dword[ok], 1
    mov [edi], ecx
    je End

End:
    cmp dword[ok], 1
    je Not
    mov ecx, [string]
    inc ecx
    mov [edi], ecx
    
Not:
    
    ;; TO DO: Implement my_strstr
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
