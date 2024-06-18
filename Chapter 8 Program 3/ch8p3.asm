; Chapter 8 Program 3
; Date: 4/28/2024


INCLUDE Irvine32.inc

;prototype for multarray
MultArray PROTO,
	arr1:PTR DWORD, 
	arr2:PTR DWORD, 
	count:DWORD

.data
array1 DWORD 10,20,30,40,50
array2 DWORD 60,70,80,90,100
arrLength DWORD ?
prompt1 BYTE "The first value in array 1: ",0
prompt2 BYTE "The first value in array 2: ",0


.code
main PROC

	mov arrLength,LENGTHOF array1	;move length of array to arrLength
	INVOKE MultArray, ADDR array1, ADDR array2, arrLength	;invoke multarray procedure
	exit

main ENDP


;proto declaration

MultArray PROC USES esi ebx ecx, arr1:PTR DWORD, arr2:PTR DWORD, count:DWORD

	mov esi,arr1	;move arr1 to esi
	mov ebx,arr2	;mov arr2 to ebx
	mov ecx,count	;mov count to ecx

	mov eax,[esi]	;move first value of arr1 to eax
	mov edx,OFFSET prompt1
	call WriteString	;display prompt1 in console
	call WriteInt		;display value 1 of arr1 in console
	call Crlf			;new line

	mov edx,OFFSET prompt2
	call WriteString	;display prompt2 in console
	mov eax,[ebx]		;move first value of arr2 to eax
	call WriteInt		;display value 1 of arr2 in console
	ret

MultArray ENDP
END main