;Eman Faisal 23-ntu-cs-1149 SE-A 3rd
;Sum of odd numbers
include irvine32.inc 
.data 
array SWORD -3,-1,-10,30,41,4 
numodd byte 0
sum Sword 0
msg db"The sum of odd values is: ",0
msg1 db"The number of odd values is: ",0
.code 
main proc 
	 	mov esi,OFFSET array     ;moving  current array element to esi
	 	mov ecx,lengthof array 
        mov eax,0
        mov ebx,0
 	 next: 
        mov ax,[esi]          ;load current element of array to ax 
	 	test  ax,1h  ; test for checking bit the and will be 1 if odd value
        jz skip            ;jump to skip if even  number
        inc numodd      ;for counting number of odd numbers
        add bx,ax             
    skip:
	 	pushfd   ;flags pushed to stack  so our test operation  flag results can be saved
 	    add esi,TYPE array  	;for moving to next array element
        popfd  ;we did push and pop so that flags not effected by our operation  
        loop next                                              ;loop repitition
    mov sum, bx                  ; Store the final sum in the sum variable
    mov edx, OFFSET msg          ; Load the message address
    call WriteString             
    movsx eax, sum                 ; Load the sum for display
    call WriteInt                
    call crlf
    mov edx,offset msg1
    call WriteString
    movsx eax,numodd
    call WriteInt

    call Crlf                    ; New line
main endp 
end main