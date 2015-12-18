dataentry :
    ;recall entered save
	mov eax, [save]
    cmp eax, 1
    je equals
    
initiation :    
    ;instruction to input nrp
    push pertama1 ;please enter your last two digits nrp 
    call printf
    add esp, 4
    
    ;scan nrp
    push nrp        
    push format_int
    call scanf    ;nrp is scanned randomly from 1-60
    add esp, 8
    
    mov eax, [nrp] 
    cmp eax, 1    ;compare to the least nrp 
    jl unidentified
    cmp eax, 60   ;compare to the most nrp
    jg unidentified
    jmp option    ;the choice of subject 

;*************************Initiation to go to Baby********************
option :     
    mov eax,4
    mov ebx,1
    mov ecx,pertama35     ;=================================
    mov edx,pertama35_len
    int 0x80 
    
    mov eax,4
    mov ebx,1
    mov ecx,pertama40     ;would you like to apply this system for baby? 
    mov edx,pertama40_len
    int 0x80 
    
    mov eax,4
    mov ebx,1
    mov ecx,pertama43     ;==> Yes(Y)
    mov edx,pertama43_len
    int 0x80 
    
    mov eax,4
    mov ebx,1
    mov ecx,pertama41     ;==> No (N)
    mov edx,pertama41_len
    int 0x80 
    
    mov eax,4
    mov ebx,1
    mov ecx,pertama42     ;:
    mov edx,pertama42_len
    int 0x80 
    
    ;input the option
    mov eax,3             ;scan the answer of option
    mov ebx,2
    mov ecx,optionbaby    
    mov edx,1
    int 0x80 
    
    ;baby is choosen
    cmp dword[optionbaby],'Y' ;compare answer with char Y
    je infant
    cmp dword[optionbaby],'y' ;compare answer with char y
    je infant

    cmp dword[optionbaby],'N' ;compare answer with char N
    je inputsex
    cmp dword[optionbaby],'n' ;compare answer with char n
    je inputsex
    jmp gone

infant :
    ;show instruction to enter the sex of baby
    push pertama36   ;please enter the sex of your baby !
    call printf 
    add esp, 4
    
    ;input sex
    push sex
    push format_int
    call scanf       ;scan the sex of baby
    add esp, 8
    
    mov eax, [sex]
    cmp eax, 1       ;sex of baby is male
    je functbaby
    jl unclassified
    
    cmp eax, 2       ;sex of baby is female
    je functbaby
    jg unclassified
    
functbaby :  
    ;proceed to bayi.asm
    call baby

;********************Input of NRP out of box**************************   
unidentified :
    ;show warning for nrp that less than 01 or greater than 60
    push pertama2    ;sorry, your nrp is unidentified
    call printf
    add esp, 4
    jmp gone
    
gone : 
    ;exit the system
    push last1       ;==================================================
    call printf
    add esp, 4
    
    push last2       ;thank you for using this BMI Calculator
    call printf
    add esp, 4
    
    mov eax, 1       ;exit
    mov ebx, 0
    int 0x80
    
;********************Apply system while baby is denied****************    
inputsex : 
    ;show instruction to enter sex
    push pertama5    ;please enter your sex !
    call printf 
    add esp, 4
    
    ;input sex
    push sex
    push format_int
    call scanf       ;scan the sex 
    add esp, 8
    
    mov eax, [sex]
    cmp eax, 1       ;sex is male
    je male
    jl unclassified
    
    cmp eax, 2       ;sex is female
    je female
    jg unclassified    

male :
    ;show instruction to enter age
    push pertama7    ;please enter your age
    call printf
    add esp, 4
    
    ;input age
    push age
    push format_int
    call scanf       ;scan the age
    add esp, 8
    
    mov eax, [age]
    cmp eax, 1       ;maximum for baby is 1 year
    jle lower
    
    ;children
    cmp eax, 10      ;1<children<=10
    jle child
    
    ;teenager
    cmp eax, 20      ;10<teenager<=20
    jle youth
   
    ;mature
    cmp eax, 35      ;mature<=35
    jle mature
    jg toold         ;to old>35
    
female :    
    ;show instruction to enter age
    push pertama7    ;please enter your age
    call printf
    add esp, 4
    
    ;input age
    push age
    push format_int
    call scanf       ;scan the age
    add esp, 8
    
    mov eax, [age]
    cmp eax, 1       ;maximum for baby is 1 year
    jle lower
    
    ;childreen
    cmp eax, 10      ;1<children<=10
    jle child
    
    ;teenager
    cmp eax, 20      ;10<teenager<=20
    jle youth
    
    ;mature
    cmp eax, 35      ;mature<=35
    jle mature
    jg toold         ;to old>35
    
lower :
    push pertama38   ;=====================The age that you entered===
    call printf
    add esp, 4
    jmp agecycle
    
toold :
    ;show instruction to over age
    push pertama8 ;you are to old to be a student of transfer program of ilkom ipb
    call printf
    add esp, 4
    jmp gone
   
agecycle :
    inc dword [counterage]
    cmp dword [counterage], 3
    jl option   
    jmp gone

;********************Face the wrong sex entered***********************
unclassified :
    ;wrong sex
    push pertama6    ;sorry, your sex is unidentified. please enter either male or female
    call printf
    add esp, 4
    jmp loopingsex   ;reenter the sex

loopingsex :
    ;allowed system running for 3 times sex inputs
    inc dword [countersex]
    cmp dword [countersex], 3
    jl inputsex
    jmp overcyclesex

overcyclesex :
    ;show warning of over cycle sex
    push pertama34   ;--------------You're just allowed---------------
    call printf
    add esp, 4
    jmp gone

;*********************When the NRP is saved***************************
equals :
    mov eax, [counter]
    dec eax
    push eax
    
loopnew :
    pop eax
    mov ebx, [nrp]
    cmp dword [database+4*eax], ebx 
    je warn
    dec eax
    push eax
    cmp eax,0
    jge loopnew
    mov eax, [counter]
    dec eax
    mov dword [database+4*eax], ebx
    mov dword[save], 0
    jmp dataentry
    
warn : 
    push eax
    push pertama3    ;sorry you have entered your data previously
    call printf
    add esp, 4
    
    push pertama4    ;please press 1 to remove your previous data or 0 to exit  
    call printf
    add esp, 4
    
    push remove
    push format_int
    call scanf       ;option of removal is choosen
    add esp, 8
    
    mov eax, [remove]
    cmp eax, 1
    je erase
    pop ebx          ;NRP is deleted
    
    cmp eax, 0
    jmp gone
    
erase :
    ;delete the NRP that is stored
    pop eax
    mov dword[database+4*eax], 0
    mov dword[save],0
    jmp dataentry
    
;********************Others Classification Except Baby****************
child :
    ;proceed to children.asm
    call children 
   
youth :
    ;proceed to teenager.asm
    call teenager   
 
mature :
    ;proceed to man.asm
    call adult
    
overcycle :
    ;show warning of over cycle
    push pertama33   ;you're just allowed to use system within 3 cycles !
    call printf
    add esp, 4
    jmp gone
    
;return 
ret 
