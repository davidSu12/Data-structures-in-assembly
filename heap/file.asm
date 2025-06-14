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

	main PROC

	
	invoke ExitProcess, 0
	main ENDP
	END main