.386
.model flat, stdcall
Include Irvine32.inc



arrayLength EQU 100

.data
	arrayTam DWORD -1
	array DWORD arrayLength DUP(?)
.code
	
	createHeap PROC

		push ebp
		mov ebp, esp

		mov arrayTam, 0

		pop ebp
		ret
	createHeap ENDP


	emptyHeap PROC
		push ebp
		mov ebp, esp

		cmp arrayTam, 0
		jb _notEqual

		mov eax, 0
		jmp _return

		_notEqual:
		mov eax, 1

		_return:

		pop ebp
		ret

	emptyHeap ENDP

	main PROC

	
	invoke ExitProcess, 0
	main ENDP
	END main