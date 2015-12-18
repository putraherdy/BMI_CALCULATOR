children :
	;recall entered sex
	mov eax, [sex]
    cmp eax, 1       ;a boy is choosen
    je boy
    
    cmp eax, 2       ;a girl is choosen
    je girl

;********************all for a boy************************************    
boy :
    ;output of boy
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama16   ;your children is a boy
    call printf
    add esp, 4
    
    push pertama18   ;your children is
    call printf
    add esp, 4
    
    push dword[age]  ;recall age
    push pertama19
    call printf
    add esp, 8
    
    push pertama30   ;************************
    call printf
    add esp, 4
    jmp checkch
    
;********************all for a girl***********************************
girl :
    ;output of a girl
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama17   ;your children is a girl
    call printf
    add esp, 4
    
    push pertama18   ;your children is
    call printf
    add esp, 4
    
    push dword[age]  ;recall age
    push pertama19
    call printf
    add esp, 8
    
    push pertama30   ;************************
    call printf
    add esp, 4
    jmp checkch
    
;********************Check the data that were entered*****************    
checkch :
    ;show instruction to checkch
    push pertama31   ;press 1 if inputs are correct or 0 if inputs are incorrect
    call printf
    add esp, 4
    
    ;input checkch
    push correction
    push format_int
    call scanf       ;scan the option of check
    add esp, 8
    
    mov eax, [correction]
    cmp eax, 0
    je inputsex      ;start over for children begin from inputsex
    
    cmp eax, 1
    je childreenideal;calculate the ideal weight for children
    jmp error
    
childreenideal :
    ;show the ideal weight of the childreen
    push anak1       ;=========|| The Ideal Weight of Your Children is=====
    call printf
    add esp, 4
    
    fild dword [age]        ;convert integer age to float
    fstp dword [age1]
    
    fld dword [age1]
    fld qword [childrenc]   ;call 2.00
    fmul                    ;multiply age to 2.00
    fstp dword [age1]
    
    fld dword [age1]
    fld qword [childrenadd] ;call 8.00
    fadd                    ;add 8.00 after (6.00*age)
    fstp dword [age1]
    
    fld dword [age1]    
    fstp qword [age2]    
    push dword [age2+4] 
    push dword [age2]
    push anak2      ;%.2f Kg
    call printf
    add esp, 12
    
    push last1 ;=======================================================
    call printf
    add esp, 4
    jmp load
    
;return
ret
