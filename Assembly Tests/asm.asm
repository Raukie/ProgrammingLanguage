global _start

section .data
msg                 db "test", 0
len dd 0
handle dd 0
lenOutput dd 0
strOutput db "",0

SECTION .bss
		; As Frank said, this should be resd 1

section .text
extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

_start:
    push -11
    call _GetStdHandle@4
     ;Getting the return value
    mov dword [handle], eax
    push dword 0
    push len
    push 4
    push msg
    push dword [handle]
    call _WriteConsoleA@20

    push dword 4
    push dword 1
    call Test

    push lenOutput
    push eax
    push strOutput
    call IntToString
    
    push dword 0
    push len
    push lenOutput
    push strOutput
    push dword [handle]
    call _WriteConsoleA@20

    push dword 0
    call _ExitProcess@4

Test:
    mov eax, dword [esp+4]
    add eax, dword [esp+8]
    ret

IntToString:
    push ebx
    mov ebx, esp ; Preserving ebx

    mov eax, [esp+12] ; Loading the int into eax
    mov ebx, [esp+8]
    
IncrementUntilNull:
    cmp ebx, 0
    je FoundEndOfString
    inc ebx; Finding the end of the string
    add dword [lenOutput], 1
    jmp IncrementUntilNull

FoundEndOfString:
    cmp eax, 0
    je EquelsNull

    mov ecx, 10
Loop:
    add dword [lenOutput], 1
    mov edx, 0
    div ecx
    sub edx, '0'
    mov ebx, edx
    inc ebx
    cmp eax, 0
    je Done
    jne Loop

EquelsNull:
    mov ebx, '0'

Done:
    inc ebx
    mov ebx, 0 ; Adding null byte

    pop ebx
    ret
