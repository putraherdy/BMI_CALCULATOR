adult :
    ;additional requirement for teenager is height and weight
	push pertama9    ;please enter your height in cm
    call printf
    add esp, 4
    
    push height     
    push format_fl   ;height of the teenager is entered
    call scanf
    add esp, 8
    
    push pertama10   ;please enter your weight in kg
    call printf 
    add esp, 4
    
    push weight      ;weight of the teenager is entered
    push format_fl
    call scanf
    add esp, 8
    
	;recall entered sex
	mov eax, [sex]
    cmp eax, 1       ;man is choosen
    je man 
   
    cmp eax, 2       ;woman is choosen
    je woman
   
;********************all for a man*************************************    
man :
    ;output of man
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama28   ;you are a man
    call printf
    add esp, 4
    
    push pertama22   ;you are 
    call printf
    add esp, 4
    
    push dword [age] ;recall age
    push pertama23
    call printf
    
    push pertama24   ;you are
    call printf
    add esp, 4
    
    fld dword[height]
    fld dword[temph]
    fmul
    fstp qword[height1]
    push dword[height1+4]
    push dword[height1]
    push pertama25   ;%.2f Cm Tall  
    call printf
    add esp, 12 
    
    push pertama26   ;your weight is
    call printf
    add esp, 4
    
    fld dword[weight]
    fld dword[tempw]
    fmul
    fstp qword[weight1]
    push dword[weight1+4]
    push dword[weight1]
    push pertama27   ;%.2f Kg 
    call printf
    add esp, 12 
    
    push pertama30   ;************************
    call printf
    add esp, 4
    jmp checkadult
    
;********************all for a woman***********************************    
woman :
    ;output of woman
    push pertama11   ;************************
    call printf
    add esp, 4
    
    push pertama29   ;you are a woman
    call printf
    add esp, 4
    
    push pertama22   ;you are 
    call printf
    add esp, 4
    
    push dword [age] ;recall age
    push pertama23
    call printf
    
    push pertama24   ;you are
    call printf
    add esp, 4
    
    fld dword[height]
    fld dword[temph]
    fmul
    fstp qword[height1]
    push dword[height1+4]
    push dword[height1]
    push pertama25   ;%.2f Cm Tall
    call printf
    add esp, 12 
    
    push pertama26   ;your weight is
    call printf
    add esp, 4
    
    fld dword[weight]
    fld dword[tempw]
    fmul
    fstp qword[weight1]
    push dword[weight1+4]
    push dword[weight1]
    push pertama27   ;%.2f Kg  
    call printf
    add esp, 12 
    
    push pertama30 ;************************
    call printf
    add esp, 4
    jmp checkadult
    
;********************Check the data that were entered*****************    
checkadult :
    ;show instruction to checkteen
    push pertama31   ;prees 1 if inputs are correct or 0 if inputs are incorrect
    call printf
    add esp, 4
    
    ;input checkadult
    push correction
    push format_int
    call scanf       ;scan the option of check
    add esp, 8
    
    mov eax, [correction]
    cmp eax, 0
    je inputsex
    
    cmp eax, 1
    je adultideal
    jg error
    
adultideal :
    ;show the BMI of the adult and compare it based on its genre
    push dewasa1 ;==================Your BMI Index is=================
    call printf
    add esp, 4
    
    fld qword [weight1] 
    fld qword [bmi]         ;call bmi 10000 and divide weight1 with that
    fmul    
    fstp qword [index]
    
    fld qword [index] 
    fld dword [height] 
    fdiv                    ;divide index by height
    fstp qword [index]

    fld qword [index]
    fld dword [height] 
    fdiv                    ;divide index by height
    fstp qword [index]

    push dword [index+4]
    push dword [index]
    push dewasa2
    call printf
    add esp, 12
    
    push last1 ;=========================================================
    call printf
    add esp, 4
    
    ;recall entered sex
	mov eax, [sex]
    cmp eax, 1
    je bmiclassm     ;back to man 
    
    cmp eax, 2
    je bmiclassw     ;back to woman
    
;********************BMI of man****************************************    
bmiclassm :
    ;classified the result of BMI that is calculated
    fld qword [thinm]       ;thinm equals to 18.00   
    fld qword [index]
    fcomip 
    jb underm        
    
    fld qword [thinm]   
    fld qword [index]
    fcomip 
    je goodm

    fld qword [idealm]       ;idealm equals to 25.00
    fld qword [index]
    fcomip
    jbe goodm
    
    fld qword [over]         ;over equals to 27.00
    fld qword [index]
    fcomip
    jbe exceedm
    
    fld qword [over]
    fld qword [index]
    fcomip
    ja abundance
    
underm :
    ;print out the result of under weight
    push dewasa3             ;sorry you are to thin, you need to increase your weight :
    call printf
    add esp, 4
    
    fld qword [thinm]        
    fld qword [index]
    fsub                     ;thinm substract BMI  
    fstp qword [point]
    
    fld qword [point]
    fld dword [height] 
    fmul                     ;result of thinm substract BMI times height
    fstp qword [point]
    
    fld qword [point]      
    fld dword [height]
    fmul                     ;result of thinm substract BMI times height
    fstp qword [point]
    
    fld qword [point]
    fld qword [bmi]
    fdiv                     ;result of thinm substract BMI times height divided by 10000(bmi)
    fstp qword [point]
    
    push dword [point+4]
    push dword [point]
    push dewasa4             ;%.2f Kg
    call printf
    add esp, 12
    
    push last1               ;========================================
    call printf
    add esp,4
    
    jmp load                 ;pursue to save

goodm :
    ;print out the result of ideal weight
    push dewasa5     ;congratulations your bmi is ideal
    call printf
    add esp, 4
    
    push last1       ;================================================
    call printf
    add esp,4
    
    jmp load         ;pursue to save
    
exceedm :
    ;print out the result of under weight
    push dewasa6     ;sorry you are to fat, you need to decrease your weight
    call printf
    add esp, 4
    
    fld qword [index]      
    fld qword [idealm]
    fsub                     ;BMI substract idealm
    fstp qword [point1]
    
    fld qword [point1]
    fld dword [height] 
    fmul                     ;result of BMI substract thinm times height
    fstp qword [point1]
    
    fld qword [point1]
    fld dword [height]
    fmul                     ;result of BMI substract thinm times height
    fstp qword [point1]
    
    fld qword [point1]
    fld qword [bmi]
    fdiv                     ;result of BMI substract thinm times height divided by 10000(bmi)
    fstp qword [point1]
    
    push dword [point1+4]
    push dword [point1]
    push dewasa4             ;%.2f Kg
    call printf
    add esp, 12
    
    push last1               ;========================================
    call printf
    add esp,4
    jmp load                ;pursue to save
    
;********************BMI of woman****************************************    
bmiclassw :
    ;classified the result of BMI that is calculated
    fld qword [thinf]   
    fld qword [index]
    fcomip                   ;thinm equals to 18.00   
    jb underf
    
    fld qword [thinf]   
    fld qword [index]
    fcomip 
    je goodf
    fld qword [idealf]
    fld qword [index]
    fcomip                   ;idealf equals to 23.00   
    jbe goodf
    
    fld qword [over]
    fld qword [index]
    fcomip                   ;over equals to 27.00   
    jbe exceedf
    
    fld qword [over]
    fld qword [index]
    fcomip
    ja abundance
    
underf :
    ;print out the result of under weight
    push dewasa3             ;sorry you are to thin, you need to increase your weight :
    call printf
    add esp, 4
    
    fld qword [thinf]
    fld qword [index]
    fsub                     ;thinf substract BMI  
    fstp qword [point2]
    
    fld qword [point2]
    fld dword [height] 
    fmul                     ;thinf substract BMI times height  
    fstp qword [point2]
    
    fld qword [point2]
    fld dword [height]
    fmul                     ;thinf substract BMI times height
    fstp qword [point2]
    
    fld qword [point2]
    fld qword [bmi]          ;thinf substract BMI times height divided by 10000(bmi)
    fdiv
    fstp qword [point2]
    
    push dword [point2+4]
    push dword [point2]
    push dewasa4             ;%.2f Kg
    call printf
    add esp, 12
    
    push last1               ;========================================
    call printf
    add esp,4
    
    jmp load                ;pursue to save
    
goodf :
    ;print out the result of ideal weight
    push dewasa5             ;congratulations your bmi is ideal
    call printf
    add esp, 4
    
    push last1               ;========================================
    call printf
    add esp,4
    
    jmp load                 ;pursue to save
    
exceedf :
    ;print out the result of exceed weight
    push dewasa6
    call printf
    add esp, 4
    
    fld qword [index]
    fld qword [idealf]
    fsub                     ;BMI substract idealf
    fstp qword [point3]
    
    fld qword [point3]
    fld dword [height] 
    fmul                     ;BMI substract idealf times height 
    fstp qword [point3]
    
    fld qword [point3]
    fld dword [height]
    fmul
    fstp qword [point3]       ;BMI substract idealf times height
    
    fld qword [point3]
    fld qword [bmi]
    fdiv                     ;BMI substract idealf times height divided by 10000(bmi)
    fstp qword [point3]
    
    push dword [point3+4]
    push dword [point3]
    push dewasa4             ;%.2f Kg
    call printf
    add esp, 12
    
    push last1               ;========================================
    call printf
    add esp,4
    jmp load                 ;pursue to save
    
;**************BMI of woman and man***********************************        
abundance :
    ;print out the result of over weight
    push dewasa7             ;watch out you need to..................    
    call printf
    add esp, 4
    
    fld qword [index] 
    fld qword [over]
    fsub                     ;BMI substract over
    fstp qword [point4]
    
    fld qword [point4]
    fld dword [height] 
    fmul                     ;BMI substract over times height
    fstp qword [point4]
    
    fld qword [point4]
    fld dword [height]
    fmul                     ;BMI substract over times height
    fstp qword [point4]
    
    fld qword [point4]
    fld qword [bmi]
    fdiv                     ;BMI substract over times height divided by 10000(bmi)
    fstp qword [point4]
    
    push dword [point4+4]
    push dword [point4]
    push dewasa4             ;%.2f Kg  
    call printf
    add esp, 12
    
    push dewasa9             ;kindly do frequently check up to your doctor
    call printf
    add esp, 4
    
    push last1               ;============================================
    call printf
    add esp,4
    
    jmp load                 ;pursue to save

;return
ret
