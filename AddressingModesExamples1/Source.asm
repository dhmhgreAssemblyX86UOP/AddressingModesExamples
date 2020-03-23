TITLE Addressing Modes Examples
INCLUDE Irvine32.inc

.data
array DWORD 10,20,30,40,50,60,70,80,90,100
arraysize = ($ - array)/4

.code
main PROC
	MOV ESI, OFFSET array			; ESI points to the first array element
	MOV EAX, [ESI]					; EAX = 10
	ADD ESI,8						; ESI points to the third array element
	MOV EAX, [ESI]					; EAX = 30
	
	MOV ESI,0						; ESI holds the distance in bytes
	MOV EAX, [array+ESI]			; EAX = 10
	ADD ESI,4						; ESI holds the distance in bytes between the first 
									; and the second element
	MOV EAX, [array+ESI]			; EAX = 20

	MOV ESI,0						; ESI holds the distance in elements
	MOV EAX, [array+ESI*4]			; EAX = 10
	ADD ESI,1						; ESI holds the distance in elements between the
									; first and the second element
	MOV EAX, [array+ESI*4]			; EAX = 20
	
	; Find the sum of array elements
	; What do we need?
	; 1) A loop						(LOOP)
	; 1) A loop counter				(ECX)
	; 2) An array index				(ESI)
	; 3) An accumulator to hold the sum	(EAX)
	
	MOV ECX,arraysize		; ECX holds the iteration count
	MOV ESI,0				; ESI holds the index of the first array element
	MOV EAX,0				; Reset the accumulator
	L1:
		ADD EAX, [array+ESI*4]	; Read the next element from memory and add it
								; to the partial sum
		INC ESI					; Increament ESI to point to the next element
	LOOP L1

	MOV ECX,arraysize		; ECX holds the iteration count
	MOV ESI,OFFSET array	; ESI holds the address of the first array element
	MOV EAX,0				; Reset the accumulator
	L2:
		ADD EAX, [ESI]	; Read the next element from memory and add it
						; to the partial sum
		ADD ESI,4		; Increament ESI to point to the next element
	LOOP L2	

	exit
main ENDP
END main