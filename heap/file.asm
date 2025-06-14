.386
.model flat, stdcall
Include Irvine32.inc



arrayLength EQU 100

.data
	arrayTam DWORD 0
	array DWORD arrayLength DUP(?)
.code


	main PROC

	
	invoke ExitProcess, 0
	main ENDP
	END main