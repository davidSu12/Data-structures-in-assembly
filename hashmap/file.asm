.386
.model flat, stdcall
Include Irvine32.inc

hashTableSize EQU 100 
wordSize EQU 10
stateSize EQU 1 

COMMENT ! for simplicty we're gonna declare simply each entry correponding to 11 btyes !
COMMENT ! The first byte corresponds to the state of the entry {0:empty, 1:full, 2: deleted} !
COMMENT ! The rest of the bytes corresponds  to the word being saved on that entry !


.data

	array BYTE (wordSize + stateSize) * hashTableSize DUP(?)
.code

	main PROC


		invoke ExitProces, 0
	main ENDP
	END main

