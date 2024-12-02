;Eman Faisal 23-ntu-cs-1149 SE-A 3rd
;Sum of positive numbers
include irvine32.inc 
.data 
array WORD 3,-6,1,-10,10,30,40,4 
numpositive byte 0 
sum WORD 0
msg db"The sum of positive values is: ",0
msg1 db"The Number of positive values is: ",0
.code 
main proc 
	 	mov esi,OFFSET array           ;move array location to esi
	 	mov ecx,lengthof array         ;for counting the number of loop rotation accourding to length of array
        mov eax,0                      ;moving 0 to remove garbage value
        mov ebx,0                      ;moving 0 to remove garbage value
 	 next: 
        mov ax,[esi]          ;load current element of array to ax 
	 	test  ax,8000h  ;first one and the rest 0 if converted to binary test for checking bit 
        jnz skip            ;jump to skip if negative number
        inc numpositive      ;for counting number of positive numbers
        add bx,ax             
    skip:
	 	pushfd   ;flags pushed to stack  so our test operation  flag results can be saved
 	    add esi,TYPE array  	;for moving to next array element
        popfd  ;we did push and pop so that flags not effected by our operation  
        loop next                                              ;loop repitition
    mov sum, bx                  ; Store the final sum in the sum variable
    mov edx, OFFSET msg          ; Load the message address
    call WriteString             
    movzx eax, sum                 ; Load the sum for display
    call WriteInt                
    call crlf
    mov edx,offset msg1
    call WriteString
    movzx eax,numpositive
    call WriteInt

    call Crlf                    ; New line
main endp 
end main