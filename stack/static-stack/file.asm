.386
.model flat, stdcall
Include Irvine32.inc

arrayMaxSize EQU 100

.data

	stackSize DWORD ?
	top DWORD ? 
	array DWORD arrayMaxSize DUP(?)

.code

main PROC


	invoke ExitProcess, 0
main ENDP
END main