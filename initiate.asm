initiate:

    ;print awal1 ********************************************
    mov eax,4
    mov ebx,1
    mov ecx,awal1
    mov edx,awal1_len
    int 0x80

    ;print awal2  ||Welcome To BMI Calculator Of  ILKOM IPB||
    mov eax,4
    mov ebx,1
    mov ecx,awal2
    mov edx,awal2_len
    int 0x80                      
    
    ; print awal3 ||                2015                   ||
    mov eax,4
    mov ebx,1
    mov ecx,awal3
    mov edx,awal3_len
    int 0x80 
	
	; print awal4 ||              Written by:              ||
    mov eax,4
    mov ebx,1
    mov ecx,awal4
    mov edx,awal4_len
    int 0x80 
    
    ; print awal5 ||*********||                 ||*********||
    mov eax,4
    mov ebx,1
    mov ecx,awal5
    mov edx,awal5_len
    int 0x80 
    
    ; print awal6 ||Boy Sandi||                 ||Herdy Dwi||      
    mov eax,4
    mov ebx,1
    mov ecx,awal6
    mov edx,awal6_len
    int 0x80 
    
    ; print awal7 ||G64154052||                 ||G64154014||
    mov eax,4
    mov ebx,1
    mov ecx,awal7
    mov edx,awal7_len
    int 0x80 
    
    ; print awal8 *******************************************
    mov eax,4
    mov ebx,1
    mov ecx,awal8
    mov edx,awal8_len
    int 0x80 
    
;return
ret
