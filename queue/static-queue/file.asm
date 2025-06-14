.386
.model flat, stdcall
Include Irvine32.inc

maxSizeQueue EQU 100

.data
	front DWORD  ?
	rear DWORD ? 
	queueSize DWORD ?
	array DWORD maxSizeQueue DUP(?)

.code

main PROC

	invoke ExitProcess, 0
main ENDP
ENDP main