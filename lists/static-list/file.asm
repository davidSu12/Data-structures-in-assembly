TITLE STATIC_LIST

.386
.model flat, stdcall
Include Irvine32.inc


listLen EQU 100
elementTam EQU 4

COMMENT ! TODO: First check that everything goes right, later optimizations !

.data
array DWORD listLen DUP(?)
top SDWORD -1

.code

insertItem PROC

	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]; posicion donde insertar
	mov ebx, [ebp + 12]; elemento a insertar

	; primero movemos todos los elementos una posicion a la derecha

	add top, 4
	mov ecx, top

	_loop:

	mov esi, ecx
	add esi, -4
	
	mov edi, array[esi]
	xchg array[ecx], edi
	
	add ecx, -4
	cmp ecx, eax
	ja _loop

	_insertElement:

	mov array[eax], ebx; elemento insertado

	pop ebp
	ret 8
insertItem PROC


deleteItem PROC

	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]  ;obtenemos la posicion que queremos
	mov edi, top
	add top, -4


	shl eax, 2
	
	_loop:
	
	mov ebx, eax
	add ebx, 4
	
	mov ecx, array[ebx]
	xchg array[eax], ecx
	
	add eax, 4
	
	cmp eax, edi
	jb _loop

	pop ebp
	ret 4

deleteItem ENDP

;se pasa primero el offset del array
;luego el elemento a buscar

getItem PROC

	push ebp
	mov ebp,esp

	mov eax, [ebp+8]
	mov esi, OFFSET array

	shl eax, 2
	cmp eax, SIZEOF array
	jb _inBound

	_outOfBound:

	mov ebx, -1
	jmp _return

	_inBound:

	mov ebx, array[eax]
		
	_return:

	pop ebp
	ret 4

getItem ENDP


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

	_retorno:

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