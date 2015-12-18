; M Iqbal Rizki P	(G64154012)
; Achmad Wisman N 	(G64154028)

; include all function
%include 'includeFunc.asm'
%include 'clearScreen.asm'
extern printf
extern scanf

section .data
clearScr db 27,'[H', 27, '[2J',0
lenClearScr equ $-clearScr
text0 	db '====================================================================',10,0
text1 	db '||	   P R O G R A M  P E N Y E W A A N  S E P E D A          ||',10,0
text2 	db '||  P I L I H  S E P E D A :                                      ||',10,0
text3 	db '|| 1. Sepeda Anak-anak                                            ||',10,0
text4 	db '|| 2. Sepeda Dewasa                                               ||',10,0
text5 	db '|| 3. Sepeda Keluarga                                             ||',10,0
text6 	db '|| 4. Exit                                                        ||',10,0
text7 	db 10,'Anda memilih sepeda Anak,',10,0
text10  db 10,'Anda memilih sepeda Dewasa,',10,0
text11  db 10,'Anda memilih sepeda Keluarga,',10,0
text8   db 'Berapa lama anda akan menyewa (jam) :',10,0
text9   db 'Total yang anda harus bayar adalah :',10,0
text12  db 'Apakah anda ingin menyewa lagi ? (1.YA / 2.TIDAK) :',10,0
text13  db 'Rp.',0
text14  db 'Apakah anda yakin memilih sepeda anak dengan harga 1000/jam ? (1.YA / 2.TIDAK)',10,0
text17  db 'Apakah anda yakin memilih sepeda dewasa dengan harga 2000/jam ? (1.YA / 2.TIDAK)',10,0
text18  db 'Apakah anda yakin memilih sepeda keluarga dengan harga 3000/jam ? (1.YA / 2.TIDAK)',10,0
text15  db 'Masukan jumlah uang yang akan dibayar :',10,0
text16  db 'Uang kembalian anda :',10,0
text19  db 'Menu yang anda pilih tidak ada !!! Pilih kembali',10,0
text20  db 'Uang yang anda masukan kurang !!! Masukan kembali jumlah yang akan dibayar :',10,0
text21  db 'Terimakasih anda sudah menyewa di tempat kami,' ,10,0
text23  db '=========  ||o)   \\//   ||__          ||o)   \\//   ||__  =========',10,0
text24  db '=========  ||o)    ||    ||__          ||o)    ||    ||__  =========',10,0

		  

section .bss
ps resd 1
lama resd 1
total resd 1
harga resd 1
uangbayar resd 1
kembalian resd 1

section .text
	global main

main:

menu:
	call clearScreen
	
	mov eax, text0
	mov ebx, 1
	call printStr
	
	mov eax, text1
	mov ebx, 1
	call printStr
	
	mov eax, text0
	mov ebx, 1
	call printStr
	
	mov eax, text2
	mov ebx, 1
	call printStr

	mov eax, text0
	mov ebx, 1
	call printStr
	

	mov eax, text3
	mov ebx, 1
	call printStr

	mov eax, text4
	mov ebx, 1
	call printStr
	
	mov eax, text5
	mov ebx, 1
	call printStr
	
	mov eax, text6
	mov ebx, 1
	call printStr
	
	mov eax, text0
	mov ebx, 1
	call printStr
	
	call scanNum
	mov dword [ps],eax

	mov eax, [ps]
	cmp eax, 1
	je sepedaanak
	cmp eax, 2
	je sepedadewasa
	cmp eax, 3
	je sepedakeluarga
	cmp eax, 4
	je byebye
	mov eax, text19
	mov ebx, 1
	call printStr
	jmp menu
	
	
	
	
sepedaanak:
	call clearScreen

	mov eax, text7
	mov ebx, 1
	call printStr

	mov eax, text14
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 2
	ja sepedaanak
	cmp eax, 1
	jne menu
	

	mov eax, 1000
	mov [harga], eax
	
	
	
	mov eax, text8
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 1
	jb sepedadewasa
	mov dword [lama],eax
		
	mov eax, [harga]
	mov ebx, [lama]
	mul ebx
	mov [total], eax
	

	mov eax, text9
	mov ebx, 1
	call printStr
	
	mov eax, text13
	mov ebx, 1
	call printStr
	
	mov eax, [total] 
	mov ebx, 1
	call printNum
	mov eax, 10
	mov ebx, 1
	call printChar
	
	jmp bayar
	
	
	
sepedadewasa:

	call clearScreen

	
	mov eax, text10
	mov ebx, 1
	call printStr
	
	mov eax, text17
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 2
	ja sepedaanak
	cmp eax, 1
	jne menu
	
	mov eax, 2000
	mov [harga], eax
	
	
	mov eax, text8
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 1
	jb sepedadewasa
	mov dword [lama],eax
		
	mov eax, [harga]
	mov ebx, [lama]
	mul ebx
	mov [total], eax
	

	mov eax, text9
	mov ebx, 1
	call printStr
	
	mov eax, text13
	mov ebx, 1
	call printStr
	
	mov eax, [total] 
	mov ebx, 1
	call printNum
	mov eax, 10
	mov ebx, 1
	call printChar
	
	jmp bayar
	
	
	
sepedakeluarga:

	call clearScreen
	
	
	mov eax, text11
	mov ebx, 1
	call printStr
	
	mov eax, text18
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 2
	ja sepedaanak
	cmp eax, 1
	jne menu
	
	mov eax, 3000
	mov [harga], eax
	
	mov eax, text8
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 1
	jb sepedakeluarga
	mov dword [lama],eax
		
	mov eax, [harga]
	mov ebx, [lama]
	mul ebx
	mov [total], eax
	

	mov eax, text9
	mov ebx, 1
	call printStr
	
	mov eax, text13
	mov ebx, 1
	call printStr
	
	mov eax, [total] 
	mov ebx, 1
	call printNum
	mov eax, 10
	mov ebx, 1
	call printChar
	
	jmp bayar	

	
	
bayar:
	mov eax, text15
	mov ebx, 1
	call printStr
masukanuang:
	call scanNum
	mov dword [uangbayar], eax
	
	mov eax, [uangbayar]
	mov ebx, [total]
	cmp eax, ebx
	jae kembaliann
	
	mov eax, text20
	mov ebx, 1
	call printStr
	jmp masukanuang
	
kembaliann:
	mov eax, [uangbayar]
	mov ebx, [total]
	sub eax, ebx
	mov [kembalian], eax
	
	mov eax, text16
	mov ebx, 1
	call printStr
	
	mov eax, text13
	mov ebx, 1
	call printStr
	
	mov eax, [kembalian]
	mov ebx, 1
	call printNum
	mov eax, 10
	mov ebx, 1
	call printChar
	
	mov eax, text21
	mov ebx, 1
	call printStr
	
	mov eax, text12
	mov ebx, 1
	call printStr
	
	call scanNum
	cmp eax, 1
	je menu
	jmp byebye
	
byebye:
	call clearScreen
	mov eax, text0
	mov ebx, 1
	call printStr
	mov eax, text0
	mov ebx, 1
	call printStr
	mov eax, text23
	mov ebx, 1
	call printStr
	mov eax, text24
	mov ebx, 1
	call printStr
	mov eax, text0
	mov ebx, 1
	call printStr
	mov eax, text0
	mov ebx, 1
	call printStr
	jmp exit
	
	; Program
	

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80


