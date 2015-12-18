;explanation ====> how does this system work ??
;input two digits of nrp : 12
;if 12 has no exist yet
;baby 
;===> nrp,sex,month (as requirement to be filled in)
;===> sex : Male ==> 0<=bay<=12 ==> 12,Male,1       ==> Y ==> ((month/2)+4) Kg
;                                                      N ==> sex : .....
;===> sex : Female ==> 0<=baby<=12 ==> 12,Female,1  ==> Y ==> ((month/2)+4) Kg
;                                                      N ==> sex : .....
;save? Y ==> 12 is recorded
;      N ==> 12 is cleared ==> Would you like to start over ==> Y ==> input of nrp : ..
;                                                               N ==> exit ==> thank you for using our system
;children 
;===> nrp,sex,year (as requirement to be filled in)
;===> sex : Male ==> 1<child<=10 ==> 12,Male,10    ==> Y ==> ((year*2)+8) Kg
;                                                  ==> N ==> sex : .....
;===> sex : Female ==> 1<=baby<=10 ==> 12,Female,10==> Y ==> ((year*2)+8) Kg
;                                                  ==> N ==> sex : .....
;save? Y ==> 12 is recorded 
;      N ==> 12 is cleared ==> Would you like to start over ==> Y ==> input of nrp : ..
;                                                               N ==> exit ==> thank you for using our system
;teenager 
;===> nrp,sex,year,height (as requirement to be filled in)
;===> sex : Male ==> 10<child<=20 ==> 100 ==> 12,Male,20,100     ==> Y ==> ((height-100)*0.9) Kg
;                                                                ==> N ==> sex : .....
;===> sex : Female ==> 10<child<=20 ==> 100 ==> 12,Female,20,100 ==> Y ==> ((height-100)*0.9) Kg
;                                                                ==> N ==> sex : .....
;save? Y ==> 12 is recorded
;      N ==> 12 is cleared ==> Would you like to start over ==> Y ==> input of nrp : ..
;                                                               N ==> exit ==> thank you for using our system
;mature 
;===> nrp,sex,year,height,weight (as requirement to be filled in)
;===> sex : Male ==> 20<mature<=35 ==> 165 ==> 62 ==> 12,Male,35,165,62 ==> Y ==> ((weight/(height*height))   ==> BMI<18 ==> "Sorry You Are To Thin, You Need To Increase Yor Weight : ((18-((weight/(height*height))*(height*height)) Kg"
;                                                                                                             ==> 18<=BMI<=25 ==> "Congratulations Your BMI is Ideal"
;                                                                                                             ==> 25<BMI<=27 ==> "Sorry You Are To Fat, You Need To Decrease Yor Weight : (((weight/(height*height))-25)*(height*height)) Kg"
;                                                                                                             ==> BMI>27 ==> "Watch Out You Have Possibility Become Obesity, You Need To Decrease Yor Weight : (((weight/(height*height))-25)*(height*height)) Kg, Kindly Do Frequently Check Up To Your Doctor"
;save? Y ==> 12 is recorded
;      N ==> 12 is cleared ==> Would you like to start over ==> Y ==> input of nrp : ..
;                                                               N ==> exit ==> thank you for using our system
;==> sex : Female ==> 20<mature<=35 ==> 155 ==> 45 ==> 12,Female,35,155,45 ==> Y ==> ((weight/(height*height))==> BMI<17 ==> "Sorry You Are To Thin, You Need To Increase Yor Weight : ((18-((weight/(height*height))*(height*height)) Kg"
;                                                                                                             ==> 17<=BMI<=23 ==> "Congratulations Your BMI is Ideal"
;                                                                                                             ==> 23<BMI<=27 ==> "Sorry You Are To Fat, You Need To Decrease Yor Weight : (((weight/(height*height))-25)*(height*height)) Kg"
;                                                                                                             ==> BMI>27 ==> "Watch Out You Have Possibility Become Obesity, You Need To Decrease Yor Weight : (((weight/(height*height))-25)*(height*height)) Kg, Kindly Do Frequently Check Up To Your Doctor"
;save? Y ==> 12 is recorded
;      N ==> 12 is cleared ==> Would you like to start over ==> Y ==> input of nrp : ..
;                                                               N ==> exit ==> thank you for using our system
;If 12 is exist
;Sorry You Have Entered Your Data Previously ==> R ==> 12 is cleared ==> would you like to start over ==> Y ==> input of nrp : ..
;                                                                                                         N ==> exit ==> thank you for using our system
;                                                N ==> thank you for using our system
;Accomplishment
;Would you like to start over 

;=============================================================================================================================================================================================================================================================================================================
;all functions
;function for showing first moment of truth
%include "initiate.asm"
;function for collecting all datas required
%include "dataentry.asm"
;function for baby's role
%include "baby.asm"
;function for children's role
%include "children.asm"
;function for teenager's role
%include "teenager.asm"
;function for mature's role
%include "adult.asm"
;mengambil fungsi print dan scan bahasa C
extern printf
extern scanf

;============================================================================================================================================================================================================================================================================================================
section .data
    ;first moment of truth
    awal1	  db	  '**********************************************************************',10,0
    awal1_len equ $-awal1 
    awal2     db      '||        Welcome To Body Mass Index Calculator Of ILKOM IPB        ||',10,0
    awal2_len equ $-awal2
    awal3     db      '||			          2015	                            ||',10,0
    awal3_len equ $-awal3
    awal4     db      '||		               Written by : 	                    ||',10,0
    awal4_len equ $-awal4
    awal5     db      '||****************||				   ||***************||',10,0
    awal5_len equ $-awal5
    awal6     db      '||  Boy Sandi K S || 				   ||    Herdy Dwi  ||',10,0
    awal6_len equ $-awal6
    awal7     db      '||    G64154052   ||				   ||    G64154014  ||',10,0
    awal7_len equ $-awal7	
    awal8     db 	  '**********************************************************************',10,0
    awal8_len equ $-awal8
    
    ;collecting datas required
    pertama1  db "Please Enter Your Last Two Digits NRP : ", 0                                       ;general rule from 01<=nrp<=60
    pertama2  db "Sorry, Your NRP is Unidentified!",10                                             ;warning for out of class nrp
              db "================================",10,0    
    pertama3  db "Sorry You Have Entered Your Data Previously",10,0                                   ;whenever nrp is saved and it is recalled
    pertama4  db "Please Press 1 To Remove Your Previous Data or 0 to Exit : ",0                      ;1 means nrp that was entered is removed and 0 means exit
    pertama5  db "Please Enter Your Sex       ==> 1. Male",10                                         ;choose Male
              db "                            ==> 2. Female",10                                       ;choose Female
              db "                            : ",0                                                   ;Data that is choosen
    pertama6  db "Sorry Your Sex is Unidentified. Please Enter Either 1. Male or 2. Female",10,0      ;rule for sex entered
    pertama7  db "Please Enter Your Age       : ",0                                                   ;0<=baby<=1 or 1<children<=10 or 10<teenager<=20 or 20<mature<=35 or to old>35  
    pertama8  db "You Are To Old To Be A Student of Transfer Program of ILKOM IPB",10,0               ;to old age
    pertama9  db "Please Enter Your Height in Cm : ",0                                                ;available for teenager and mature
    pertama10 db "Please Enter Your Weight in Kg : ",0                                                ;available for mature only
    pertama11 db "***********************************",10,0                                           ;appearence support
    pertama12 db "*       Your Baby is a Male       *",10,0                                           ;recall sex that was entered for male 
    pertama13 db "*      Your Baby is a Female      *",10,0                                           ;recall sex that was entered for female
	pertama14 db "*    Your Baby is ",0                                                              ;recall age that was entered in range 0 to 1 year (pins down)
    pertama15 db "%.2f Year Old   *",10,0                                      
    pertama16 db "*      Your Children is a Boy     *",10,0                                           ;recall sex that was entered for male         
    pertama17 db "*     Your Children is a Girl     *",10,0                                           ;recall sex that was entered for female
    pertama18 db "*   Your Children is ",0                                                              ;recall age that was entered in range 1 to 10 years (pins down)
    pertama19 db "%d Years Old  *",10,0                                      
    pertama20 db "*          You Are a Boy          *",10,0                                           ;recall sex that was entered for male  
    pertama21 db "*         You Are a Girl          *",10,0                                           ;recall sex that was entered for female
    pertama22 db "*      You Are ",0                                                                  ;recall age that was entered in range 10 to 20 years (pins down)
    pertama23 db "%d Years Old       *",10,0
    pertama24 db "*     You Are ",0                                                                   ;recall height that was entered for teenager (pins down)
    pertama25 db "%.2f Cm Tall      *",10,0
    pertama26 db "*     Your Weight is ",0                                              ;recall weight that was entered for mature (pins down)
    pertama27 db "%.2f Kg     *",10,0
    pertama28 db "*          You Are a Man          *",10,0
    pertama29 db "*         You Are a Woman         *",10,0
    pertama30 db "***********************************",10,0
    pertama31 db "Press 1 if Inputs are Correct or 0 if Inputs are Incorrect : ",0                                    ;based on inputs that were shown
    pertama32 db "---------- Your Input is Incorrect. System Will Start Over !----------",10,0                        ;forced system to stop when input out of requirement
    pertama33 db "--------- You're Just Allowed To Use System Within 4 Cycles !---------",10,0                        ;forced system to stop when cycles are greater than 5
    pertama34 db "--------- You're Just Allowed To Type Your Sex For 3 Cycles !---------",10,0
    pertama35 db "======================================================================",10
    pertama35_len equ $-pertama35          
    pertama40 db "Would You Like To Apply This System For Baby?",10 
	pertama40_len equ $-pertama40  
    pertama43 db "                                   ==> Yes(Y)",10     
	pertama43_len equ $-pertama43
	pertama41 db "                                   ==> No (N)",10
	pertama41_len equ $-pertama41
	pertama42 db "                                   : ",0
    pertama42_len equ $-pertama42
    pertama36 db "Please Enter The Sex Of Your Baby! ==> 1. Male",10                                         ;choose Male
              db "                                   ==> 2. Female",10                                       ;choose Female
              db "                                   : ",0                                                   ;Data that is choosen
    pertama37 db "Please Enter The Age Of Your Baby (In Month)! : ",0                                                   ;0<=baby<=1 or 1<children<=10 or 10<teenager<=20 or 20<mature<=35 or to old>35  
    pertama38 db "========================================================",10
              db "  The Age That You Entered Is Lower Than The Range  ",10
              db "       Try To Chose Baby As The Classification      ",10,0    
    pertama39 db "=====================================================",10
              db "The Age That You Are Entered Is Higher Than The Range",10
              db "       Try To Dismiss Baby As The Classification     ",10,0    

	;baby's output
	bayi1     db "======================================================================",10  ;appearence support
	          db "||           The Ideal Weight of Your Baby is : ",0
	bayi2     db "%.2f Kg             ||",10,0 
	
	;children's output 
	anak1     db "======================================================================",10  ;appearence support  
	          db "||         The Ideal Weight of Your Children is : ",0
	anak2     db "%.2f Kg          ||",10,0

	;teenager's output
	remaja1   db "=============================================================",10 ;appearence support
	          db "||      Your Ideal Weight as a Teenager is : ",0
	remaja2   db "%.2f Kg      ||",10,0
	
	;mature's output
	dewasa1   db "======================================================================",10
	          db "||                     Your BMI Index is : ",0
	dewasa2   db "%.2f                    ||",10,0
	dewasa3   db "|| Sorry You Are To Thin, You Need To Increase Yor Weight : ",0
	dewasa4   db "%.2f Kg ||",10,0
	dewasa5   db "||                 Congratulations Your BMI is Ideal                ||",10,0
	dewasa6   db "|| Sorry You Are To Fat, You Need To Decrease Yor Weight : ",0
	dewasa7   db "||            Watch Out You Have Possibility Become Obesity         ||",10
	          db "||             You Need To Decrease Yor Weight : ",0
	dewasa9   db "||            Kindly Do Frequently Check Up To Your Doctor !        ||",10,0
	dewasa10  db "======================================================================",10,0
	
	;instruction to save
	simpan1   db  "Would You Like To Save Your Data ==> 1. Yes",10,0
	simpan2   db  "                                 ==> 2. No",10,0
    simpan3   db  "                                 ==> 3. Exit",10,0
    simpan4   db  "                                 : ",0

	;finishing
	last1     db "======================================================================",10,0
	last2     db "❤❤❤❤❤❤❤❤ Thank You, For Using This BMI Calculator ❤❤❤❤❤❤❤❤",10,0
    last3     db "=============================================================",10,0
    
    ;format
    format_fl db "%f",0
    format_int db "%d",0
    
    ;temporary for int to float convertion
    temph     dd 1.0
    tempw     dd 1.0
    
    ;const
    babyl dq 0.00
    babyc dq 2.0
    babyadd dq 4.0
    babymonth dq 12.0
    childrenc dq 2.0
    childrenadd dq 8.0
    teenagerc dq  0.9
    teenagersub dq 100.00
    bmi dq 10000.00

    ;counter
    counter dd 0
    countersex dd 0
    counterage dd 0

    ;BMI classification
    ;male
    thinm dq 18.00
    idealm dq 25.00
    over dq 27.00
    ;female
    thinf dq 17.00
    idealf dq 23.00
    
    ;data
	database dd 0,0,0,0
    
section .bss
    nrp resd 100
    ageby resq 100
    age resd 100
    age1 resd 100
    age2 resq 100
    age3 resq 100
    height resd 100
    height1 resq 100
    weight resd 100
    weight1 resq 100
    correction resd 100
    remove resd 100
	sex resd 100
	save resd 100
	optionbaby resd 100
	point resq 100
    point1 resq 100
    point2 resq 100
    point3 resq 100
    point4 resq 100
    index resq 100
    
section .text
    global main

main:
	call initiate
	call dataentry
	
exit:
    ; exit program
    mov eax, 1
    mov ebx, 0
    int 0x80
