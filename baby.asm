baby :
	;recall entered sex
	mov eax, [sex]
    cmp eax, 1       ;baby male is choosen
    je babymale
    
    cmp eax, 2       ;baby female is choosen
    je babyfemale
    
;********************all for baby male********************************
babymale :
    ;show instruction to enter age
    push pertama37   ;please enter the age of your baby 
    call printf
    add esp, 4
    
    push ageby
    push format_fl
    call scanf       ;age of baby male is entered
    add esp, 8
    
    fld qword [babymonth] ;12.00
    fld qword [ageby]
    fcomip 
    ja high
    
    fld qword [babyl]     ;0.00
    fld qword [ageby]
    fcomip 
    jb lower
    
    ;output of baby male
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama12   ;your baby is a male
    call printf
    add esp, 4
    
    push pertama14   ;your baby is
    call printf
    add esp, 4
    
    fld dword [ageby]
    fld qword [babymonth]   ;cal 12.00
    fdiv                    ;divide age by 12.00
    fstp qword [age3]    
    push dword [age3+4] 
    push dword [age3]
    push pertama15   ;%.2f year old
    call printf
    add esp, 12
    
    push pertama30 ;************************
    call printf
    add esp, 4
    jmp check
    
;********************all for baby female******************************    
babyfemale :
    ;show instruction to enter age
    push pertama37   ;please enter the age of your baby
    call printf
    add esp, 4
    
    ;input age
    push ageby
    push format_fl
    call scanf       ;age of baby female is entered
    add esp, 8

    fld qword [babymonth] ;12.00
    fld qword [ageby]
    fcomip 
    ja high
    
    fld qword [babyl]
    fld qword [ageby]
    fcomip 
    jb lower
    
    ;output of baby female
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama13   ;your baby is a female
    call printf
    add esp, 4
    
    push pertama14   ;your baby is
    call printf
    add esp, 4
    
    fld dword [ageby]
    fld qword [babymonth]   ;cal 12.00
    fdiv                    ;divide age by 12.00
    fstp qword [age3]    
    push dword [age3+4] 
    push dword [age3]
    push pertama15   ;%.2f year old
    call printf
    add esp, 12
    
    push pertama30 ;************************
    call printf
    add esp, 4
    jmp check
    
;********************Check the data that were entered*****************  
check :
    ;show instruction to check
    push pertama31   ;press 1 if inputs are correct or 0 if inputs are incorrect
    call printf
    add esp, 4
    
    ;input check
    push correction
    push format_int
    call scanf       ;scan the option of check
    add esp, 8
    
    mov eax, [correction]
    cmp eax, 0
    je infant        ;start over for data entry begin from the sex of baby
    
    cmp eax, 1
    je babyideal     ;calculate the ideal weight for baby
    jmp error        ;input is out of reference
    
error :
    ;show warning for starting over
    push pertama32   ;your input is incorrect. system will start over
    call printf
    add esp, 4
    push last1
    call printf
    add esp, 4
    jmp gone
    
babyideal :
    ;show the ideal weight of the baby
    push bayi1          ;========The Ideal Weight of Your Baby is=======
    call printf
    add esp, 4

    fld dword [ageby]
    fld qword [babyc]   ;cal 2.00
    fdiv                ;divide age by 2.00
    fstp dword [ageby]
    
    fld dword [ageby]
    fld qword [babyadd] ;call 4.00
    fadd                ;add 4.00 after (6.00*age)
    fstp qword [age2]
    
    push dword [age2+4] 
    push dword [age2]
    push bayi2          ;%.2f Kg
    call printf
    add esp, 12
    
    push last1 ;=======================================================
    call printf
    add esp, 4
    jmp load

;********************Save the data that were entered*******************  
load :
    ;show a cure to load data
    push simpan1     ;would you like to save your data ==> 1.yes
    call printf
    add esp, 4
    
    push simpan2     ;==> 2.no
    call printf
    add esp, 4
    
    push simpan3     ;==> 3.exit
    call printf
    add esp, 4
    
    push simpan4     ;:
    call printf
    add esp, 4
    
    push save
    push format_int
    call scanf
    add esp, 8
    
    mov eax, [save]
    cmp eax, 1       ;NRP will be saved and cycle will be calculated
    je back
    
    cmp eax, 2       ;NRP won't be saved and cycle will be calculated
    je back         
    
    cmp eax, 3       ;exit
    je gone 
    jg error         ;wrong input go out system

;********************When age that is entered over the range*********
high :
    ;over range of baby's age
    push pertama39   ;=====the age that you entered is higher than====
    call printf
    add esp, 4
    jmp agecycle     ;cycle of add be add 1 and compared with 3

back :
    ;count cycle and compare it to 4
    inc dword [counter]
    cmp dword [counter], 4
    jl dataentry
    jmp overcycle

;return
ret
