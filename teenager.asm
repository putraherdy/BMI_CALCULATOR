teenager :
    ;additional requirement for teenager is height
    push pertama9    ;please enter your height in cm
    call printf
    add esp, 4
    
    push height
    push format_fl   ;height of the teenager is entered
    call scanf
    add esp, 8
	
	;recall entered sex
	mov eax, [sex]
    cmp eax, 1       ;adolescent is choosen
    je adolescent
    
    cmp eax, 2       ;maiden is choosen
    je maiden
 
;********************all for adolescent*******************************   
adolescent :
    ;output of adolescent
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama20   ;you are a boy
    call printf
    add esp, 4
    
    push pertama22   ;you are 
    call printf
    add esp, 4
    
    push dword[age]  ;recall age
    push pertama23
    call printf
    
    push pertama24   ;you are
    call printf
    add esp, 4
    
    fld dword[height]
    fld dword[temph]
    fmul             ;forced for float to be printed by times it with 1.00
    fstp qword[height1]
    push dword[height1+4]
    push dword[height1]
    push pertama25   ;%.2f Cm Tall
    call printf
    add esp,12
    
    push pertama30   ;************************
    call printf
    jmp checkteen

;********************all for maiden***********************************
maiden :
    ;output of maiden
    push pertama11  ;************************
    call printf
    add esp, 4
   
    push pertama21  ;you are a girl
    call printf
    add esp, 4
    
    push pertama22  ;you are 
    call printf
    add esp, 4
    
    push dword[age] ;recall age
    push pertama23
    call printf
    
    push pertama24  ;you are
    call printf
    add esp, 4
    
    fld dword[height]
    fld dword[temph]
    fmul
    fstp qword[height1]
    push dword[height1+4]
    push dword[height1]
    push pertama25
    call printf
    add esp,12
    
    push pertama30   ;************************
    call printf
    jmp checkteen
    
;********************Check the data that were entered*****************    
checkteen :
    ;show instruction to checkteen
    push pertama31   ;prees 1 if inputs are correct or 0 if inputs are incorrect
    call printf
    add esp, 4
    
    ;input checkteen
    push correction
    push format_int
    call scanf       ;scan the option of check
    add esp, 8
    
    mov eax, [correction]
    cmp eax, 0
    je inputsex
    
    cmp eax, 1
    je teenagerideal
    jmp error
    
teenagerideal :
    ;show the ideal weight of the teenager
    push remaja1     ;===========The Ideal Weight as a Teenager is=====
    call printf
    add esp, 4
    
    fld dword [height]
    fld qword[teenagersub]
    fsub                      ;substract height with 100
    fstp dword [height]
    fld dword [height]
    fld qword[teenagerc]
    fmul                      ;multiply 0.9 after (height-100.00)
    fstp qword [height1]    
    push dword [height1+4] 
    push dword [height1]
    push remaja2
    call printf
    add esp, 12
    
    push last3       ;================================================
    call printf
    jmp load
    
;return
ret
