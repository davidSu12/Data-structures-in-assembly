TITLE STATIC_LIST

.386
.model flat, stdcall
Include Irvine32.inc


listLen EQU 100
elementTam EQU 4


COMMENT ! 
IMPLEMENTED FUNCTIONS:
-createEmptyList
-isEmptyList
-next
-previous
-last
-first
-len


NOT IMPLEMENTED:

-insertItem
-deleteItem
-getItem
-searchItem

! 

.data
array DWORD listLen DUP(?)
top SDWORD -1

.code

;se pasa primero el offset del array
;luego el elemento a buscar

searchItem PROC

	push ebp
	mov ebp, esp
	
	mov ecx, 0
	mov eax, [ebp + 8]
	mov esi, OFFSET array 


	_loop:
	cmp eax, [esi]
	je _return

	add ecx, 4
	add esi, 4

	cmp ecx, SIZEOF array
	je _notFound
	jmp _loop

	_notFound:
	mov ecx, -1

	_return:
	
	pop ebp
	ret 4

searchItem ENDP

len PROC 

	push ebp
	mov ebp, esp

	mov eax, top

	pop ebp
	ret

len ENDP

createEmptyList PROC
	push ebp
	mov ebp, esp

	mov top, 0

	pop ebp
	ret
createEmptyList ENDP


isEmptyList PROC
	push ebp
	mov ebp, esp

	cmp top, 0
	jne _isNotEmpty
	mov eax, 1
	jmp _retorno

	_isNotEmpty:
	mov eax, 0

	_retorno :
	pop ebp
	ret
	isEmptyList ENDP

first PROC

	push ebp
	mov ebp, esp

	mov eax, 0

	pop ebp
	ret

first ENDP


last PROC

	push ebp
	mov ebp, esp

	mov eax, SIZEOF array 

	pop ebp
	ret

last ENDP

next PROC

	; comprobamos paridad, si se nos da paridad impar retornamos con error directamente

	push ebp
	mov ebp, esp

	mov eax, DWORD PTR [ebp + 8]
	test eax, 00000001h
	jnz _error

	_notError:
	cmp eax, SIZEOF array
	ja _greater

	_below:
	add eax, 4
	jmp _return

	_greater:
	_error:
	mov eax, -1
	

	_return:
	pop ebp
	ret 4

next ENDP

previous PROC

	push ebp
	mov ebp, esp

	mov eax, DWORD PTR [ebp + 8]
	test eax, 00000001h
	jnz _error

	_notError:
	cmp eax, 0
	jbe _below

	_greater:
	add eax, -4
	jmp _return

	_below:
	_error:

	mov eax, -1

	_return:

	pop ebp
	ret 4

previous ENDP

imprimirArray PROC

	push ebp
	mov ebp, esp

	mov esi, [ebp + 8]
	mov ecx, [ebp + 12]

	_loop:

	mov eax, [esi]
	call WriteDec
	call Crlf
	add esi, 4
	loop _loop

	pop ebp
	ret 8

imprimirArray ENDP



main PROC


	invoke ExitProcess, 0

main ENDP
END main