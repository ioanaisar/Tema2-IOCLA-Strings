%include "io.mac"

section .text
    global vigenere
    extern printf

section .data
	var DD 0
	plain DD 0
	key DD 0

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY
    
    mov [var], ebx
    mov [plain], ecx
    mov [key], ebx
    mov ecx, 1
    mov dword[key], 1
    inc dword[var]
    inc dword[plain]

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

Put: mov eax, ebx

	push ebx
	push ecx
	push eax
    mov ecx, dword [key]
	cmp ecx, dword[var]
	je Reset
On:	
	xor eax, eax
	mov al, [edi + ecx - 1 ]
	inc ecx
	inc dword [key]

    sub eax, 65
    
    pop ebx

	mov ecx, ebx
	add ebx, eax
	mov eax, ecx

	pop ecx
	pop eax
    cmp eax, 90

    jle Big
    cmp eax, 97
    jge Small 

 Do:
    mov  byte [edx + ecx - 1], bl
    inc ecx
    cmp ecx, dword[plain]
    jl Letter

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
    cmp ecx, dword[plain]
    jl Do
    jg No

Above:
     sub ebx, 122
     mov eax, 'a'
     add eax, ebx
     dec eax
     mov ebx, eax
     cmp eax, 122
     jg Above
    mov ebx, eax
    cmp ecx, dword[plain]
    jl Do
    jg No

 mov ecx, 0

Reset:

	mov ecx, 1
	mov [key], ecx
	cmp ecx, 0
	jg On


 mov ecx, dword[plain]
 inc ecx

No:
    cmp ecx, dword[plain]
    jl Do


    ;; TODO: Implement the Vigenere cipher

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY