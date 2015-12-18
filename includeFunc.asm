

	; Fungsi untuk membuka file
	; Argument: eax (Alamat nama string)
	; Result: eax (Alamat file yg sudah di open);

; Fungsi untuk menginclude semua fungsi yang telah dibuat sebelumnya

%ifndef _includeFunc
%define _includeFunc

	; Fungsi untuk scan angka
	; Result: eax (int)
	%include "scanNum.asm"

	; Fungsi untuk cetak angka
	; Argument: eax (int)
	%include "printNum.asm"

	; Fungsi untuk print character ke stdout atau stderr
	; Argument: al (char), ebx (stdout 1 atau stderr 2)
	%include "printChar.asm"
	
	; Fungsi untuk print string ke stdout atau stderr, kata harus diakhiri dengan null
	; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
	%include "printStr.asm"


	; Fungsi untuk membaca kata
	; Result: eax (alamat character pertama), ebx (int atau panjang kata)
	;%include "scanStr.asm"


	; Fungsi untuk membandingkan 2 kata, kata harus diakhiri dengan null
	; Argument: eax (alamat char pertama kata ke 2), ebx (alamat char pertama kata ke 2)
	; Result: eax (1: sama, 0: beda)
	;%include "cmpStr.asm"

	; Fungsi untuk copy dari kata1 (dari eax) ke kata2 (dari ebx) --> ebx = eax, harus diakhiri null
	; Argument: eax (alamat character pertama yang akan dicopy), ebx (alamat character pertama hasil)
	;%include "cpyStr.asm"

	; Fungsi untuk clean hasil scan
	;%include "scanClean.asm"

	; Fungsi untuk konversi string ke integer
	; Argument: eax (alamat string)
	; Result: eax (int)
	;%include "strToNum.asm"


	; Fungsi untuk membuka file
	; Argument: eax (Alamat string nama file)
	; Result: eax (Alamat file)
	;%include "createFile.asm"

	; Fungsi untuk membuka file
	; Argument: eax (Alamat nama string)
	; Result: eax (Alamat file yg sudah di open)
	;%include "openFile.asm"

	; Fungsi untuk membuka file
	; Argument: eax (Alamat file)
	;%include "closeFile.asm"


%endif
