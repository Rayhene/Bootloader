org 0x7e00
jmp 0x0000:start

data:
	
	;Dados do projeto...
	as db 'as', 0
    JoaoVictor db 'Joao Victor', 0
    jvol db 'jvol', 0
    Rayhene db 'Rayhene', 0
    rrda db 'rrda', 0
    Irineu db 'Irineu', 0
    iaps db 'iaps', 0
    Pedro db ' Pedro', 0
    phagp db ' phagp', 0

	inicio db 'Aperte espaco para comecar', 0
	Resposta db 'Resposta: ', 0
	local_res db'Resposta: ',0

	Errou db 'Daqui nao passa, tente de novo.', 0
	Acertou2 db 'Pode passar.', 0

	Q1_1 db 'O que eh meu, mas as pessoas', 0
    Q1_2 db 'falam mais dele que eu?', 0
	R1 db 'nome', 0


	pkb0 db '    @@@@@@@@@@@     ',13,10,0
	pkb1 db '   @@@@@@@@@@@@@    ',13,10,0 
	pkb2 db '  @@@@@@@@@@@@@@@   ',13,10,0
	pkb3 db ' @@@@@@@@@@@@@@@@@  ',13,10,0
    pkb4 db '   ||||[...]||||    ',13,10,0
	pkb5 db ' OOOOOOOOOOOOOOOOO  ',13,10,0 
	pkb6 db '  OOOOOOOOOOOOOOO   ',13,10,0  
	pkb7 db '   OOOOOOOOOOOOO    ',13,10,0
	pkb8 db '    OOOOOOOOOOO     ',13,10,0	

	Q2 db 'Quem eh esse Pokemon?', 0
	R2 db 'pikachu', 0

	Q3_1 db 'Quem ganha?', 0
	Q3_2 db 'f1               f2', 0
	Q3_3 db '<----------      ------------>', 0
	R3 db 'f2', 0

	Q4 db 'Quantas perguntas ja foram respondidas?', 0
	R4 db '3', 0

	Q5_1 db 'Qual o proximo numero na sequencia:',0 
    Q5_2 db '2, 10, 12, 16, 17, 18, 19, ...?', 0
    R5 db '200', 0

	a0 db '        .:         ',13,10,0
	a1 db '     __ :`__       ',13,10,0
	a2 db '   .``  `-`  ``.   ',13,10,0
	a3 db '  :          .-`   ',13,10,0
	a4 db '  :         :      ',13,10,0
	a5 db '   :         `-.   ',13,10,0
	a6 db '    `.__.-.__./    ',13,10,0

    R6 db 'apple', 0

    Q7_1 db 'Quem o inventou nao o quer.', 0
    Q7_2 db 'Quem comprou nao precisa disso.', 0
    Q7_3 db 'Quem precisa nao sabe disso.', 0
    R7 db 'caixao', 0

    Q8_1 db 'Tem cidades, mas nao tem casas.', 0
    Q8_2 db 'Tem montanhas, mas nao tem arvores.', 0
    Q8_3 db 'Tem agua, mas nao tem peixe.', 0
    R8_ db 'mapa', 0

	Q9 db '0  1  1  2  3  5  8  X', 0
    R9_ db '13', 0

	quadro0 db '  ----------------- ',13,10,0
	quadro1 db ' |                 |',13,10,0
	quadro2 db ' |    Parabens!    |',13,10,0
	quadro3 db ' |_________________|',13,10,0

	emj0 db '( /^.^)/                   \(^-^\ ) ',13,10,0

	f1_0 db ' .``. ',13,10,0
	f1_1 db ':_\/_:',13,10,0
	f1_2 db ': /\ :',13,10,0
	f1_3 db ' `..` ',13,10,0 	


	f2_0 db ' *``* ',13,10,0 
	f2_1 db '*_\/_*',13,10,0 
	f2_2 db '* /\ *',13,10,0 
	f2_3 db ' *..* ',13,10,0 

	f3_0 db ' .\"/. ',13,10,0 
	f3_1 db '-= o =-',13,10,0 
	f3_2 db '.`/.\`.',13,10,0 
	f3_3 db '   :   ',13,10,0    

	f4_0 db '  .  ',13,10,0
	f4_1 db '_\(/_',13,10,0
	f4_2 db './)\ ',13,10,0
	f4_3 db '  `  ',13,10,0

	fim0 db ' _______  ___   __   __  __  ',13,10,0
	fim1 db '|       ||   | |  |_|  ||  | ',13,10,0
	fim2 db '|    ___||   | |       ||  | ',13,10,0
	fim3 db '|   |___ |   | |       ||  | ',13,10,0
	fim4 db '|    ___||   | |       ||__| ',13,10,0
	fim5 db '|   |    |   | | ||_|| | __  ',13,10,0
	fim6 db '|___|    |___| |_|   |_||__| ',13,10,0
                       

%macro print_jump 0
	call printString
	call endl
%endmacro

%macro Video_Mode 0
    mov ah, 00h
    mov al, 13h
	int 10h
%endmacro

%macro Macro_cursor	2
	mov dh, %1
	mov dl, %2
	call set_cursor
%endmacro

%macro fireworks1	1
	mov bl, %1
	call fw1
%endmacro

%macro fireworks2	1
	mov bl, %1
	call fw2
%endmacro

%macro fireworks3	1
	mov bl, %1
	call fw3
%endmacro

%macro fireworks4	1
	mov bl, %1
	call fw4
%endmacro

%macro fireworks5	1
	mov bl, %1
	call fw5
%endmacro

set_cursor:     ;dh = linha/eixo y ~ dl = coluna/eixo x
	mov ah, 02h ;set cursor position 
	mov bh, 00h ;page number
	int 10h

	ret

putchar:
    mov ah, 0x0e
    int 10h
ret

getchar:
    mov ah, 0x00
    int 16h
ret

printString:

	.loop:
		lodsb ; carrega caracter em al
		cmp al, 0

		je .endloop

		call putchar

		jmp .loop
	.endloop:
ret

delchar:
  mov al, 0x08  ;backspace       
  call putchar
  mov al, ' '
  call putchar
  mov al, 0x08          
  call putchar
ret
  
endl:
  mov al, 0x0a  ;\n (fim de linha)       
  call putchar
  mov al, 0x0d          
  call putchar	;\r (carriage return)
ret

gets:                 ; mov di, string
  xor cx, cx          ; zerar contador
  .loop1:
    call getchar
    cmp al, 0x08      ; backspace
    je .backspace
    cmp al, 0x0d      ; carriage return
    je .done
    cmp cl, 10        ; string limit checker
    je .loop1
    
    stosb
    inc cl
    call putchar
    
    jmp .loop1
    .backspace:
      cmp cl, 0       ; is empty?
      je .loop1
      dec di
      dec cl
      mov byte[di], 0
      call delchar
    jmp .loop1
  .done:
  mov al, 0
  stosb  ;store AL at address ES:(E)DI
  call endl
ret

; mov si, string1, mov di, string2
comp:       ;Compara duas palavras ate ambas chegarem a 0
    .loop:
    lodsb  ;Load byte at address DS:(E)SI into AL
    mov cl,byte [di]
    inc di
    ;Chegou no final
    cmp al,0
    je .al_fim
    cmp al, cl
    je .loop
	mov dx, 1
    jmp .end
    .al_fim:
    cmp cl, 0
	je .igual
	mov dx, 1
	jmp .end
	.igual:
	mov dx, 0
	.end:
ret

delay: ;delay para transição janela certo e errado e para creditos
    xor dx,dx
    .delay:
	inc dx
	mov cx, 0
		.time:
			inc cx
			cmp cx, 100000
			jne .time
	cmp dx, 16000
	jne .delay
ret

delay2:  ;delay para fogos de artificio 
    xor dx,dx
    .delay:
	inc dx
	mov cx, 0
		.time:
			inc cx
			cmp cx, 100000
			jne .time
	cmp dx, 9000
	jne .delay
ret

delay3: ;delay para printar mensagem
    xor dx,dx
    .delay:
    inc dx
    mov cx, 0
        .time:
            inc cx
            cmp cx, 10000
            jne .time
    cmp dx, 3000
    jne .delay
ret

print_string_delay:
.loop:
        lodsb
        cmp al, 0
        je .endloop

        call putchar
        call delay3

        jmp .loop
    .endloop:
ret

pergunta1:
	.loop_pergunta_1:
		Video_Mode
		Macro_cursor 6, 6 ;primeiro valor: posição vertical, segundo valor: posição horizontal
		mov bl, 14
	    mov si, Q1_1
		call print_string_delay

        Macro_cursor 8, 9

	    mov si, Q1_2
		call print_string_delay
    
		Macro_cursor 12, 13

		mov si, local_res
		call print_string_delay
		mov di, Resposta
		call gets

		mov di, Resposta
        mov si, R1
		call comp

		cmp dx, 0
		je .endloop_1
		Video_Mode

		Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_1
	.endloop_1:
		Video_Mode

		Macro_cursor 10, 13
		mov bl, 10
		mov si, Acertou2
		call print_string_delay
        call delay
	
	ret

pergunta2:

	.loop_pergunta_2:
		Video_Mode

		Macro_cursor 1, 10
		mov bl, 4
		mov si, pkb0
		call printString

		Macro_cursor 2, 10
		mov si, pkb1
		call printString

		Macro_cursor 3, 10
		mov si, pkb2
		call printString

		Macro_cursor 4, 10
		mov bl, 4
		mov si, pkb3
		call printString

		Macro_cursor 5, 10
		mov bl, 7
		mov si, pkb4
		call printString

		Macro_cursor 6, 10
		mov bl, 15
		mov si, pkb5
		call printString

		Macro_cursor 7, 10
		mov si, pkb6
		call printString

		Macro_cursor 8, 10
		mov si, pkb7
		call printString

		Macro_cursor 9, 10
		mov si, pkb8
		call printString

		Macro_cursor 12, 9
		mov bl, 14
		mov si, Q2
		call print_string_delay
        call endl

		Macro_cursor 14, 11
		mov si, local_res
		call print_string_delay
		mov di, Resposta
		call gets

		mov di, Resposta
        mov si, R2
		call comp

		cmp dx, 0
		je .endloop_2
		Video_Mode

		Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_2
	.endloop_2:
		Video_Mode
		Macro_cursor 10, 13
		mov bl, 10
		mov si, Acertou2
		call print_string_delay
        call delay
ret
	
pergunta3:
	.loop_pergunta_3:
		Video_Mode
		Macro_cursor 6, 13
		mov bl, 13
		mov si, Q3_1
		call print_string_delay
        
		Macro_cursor 8, 10

		mov si, Q3_2
		print_jump

		Macro_cursor 10, 4

		mov si, Q3_3
		print_jump

		Macro_cursor 12, 12

		mov si, local_res
		call print_string_delay
		mov di, Resposta;pegar resposta
		call gets

		mov di, Resposta
        mov si, R3
		call comp

		cmp dx, 0
		je .endloop_3
		Video_Mode

		Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_3
	.endloop_3:
		Video_Mode
        Macro_cursor 10, 13
		mov bl, 10
		mov si, Acertou2
		call print_string_delay
        call delay
	ret

pergunta4:
	.loop_pergunta_4:
		Video_Mode
		Macro_cursor 8, 1
		mov bl, 13
		mov si, Q4
		print_jump

		Macro_cursor 10, 13

		mov si, local_res
		call print_string_delay
		mov di, Resposta;pegar resposta
		call gets

		mov di, Resposta
        mov si, R4
		call comp

		cmp dx, 0
		je .endloop_4
		Video_Mode
		Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_4
	.endloop_4:
		Video_Mode
		Macro_cursor 10, 13
		mov bl, 10
		mov si, Acertou2
		call print_string_delay
        call delay
	ret

pergunta5:
	.loop_pergunta_5:
		Video_Mode
		Macro_cursor 8, 2
		mov bl, 56
        mov si, Q5_1
        call print_string_delay

        Macro_cursor 10, 4

        mov si, Q5_2
        call print_string_delay
                
		Macro_cursor 12, 13

		mov si, local_res
        call print_string_delay
        mov di, Resposta
        call gets

        mov di, Resposta
        mov si, R5
        call comp

        cmp dx, 0
        je .endloop_5
        Video_Mode

        Macro_cursor 10, 3
		mov bl, 12
        mov si, Errou
        call print_string_delay
        call delay
        jmp .loop_pergunta_5
    .endloop_5:
        Video_Mode
		Macro_cursor 10, 13
		mov bl, 10
        mov si, Acertou2
        call print_string_delay
        call delay
    ret

pergunta6:
 	.loop_pergunta_6:
    	Video_Mode
        Macro_cursor 6, 10
		mov bl, 56
        mov si, a0
        call printString

		Macro_cursor 7, 10
        mov si, a1
        call printString

		Macro_cursor 8, 10
        mov si, a2
        call printString

        Macro_cursor 9, 10
        mov si, a3    
        call printString

        Macro_cursor 10, 10
        mov si, a4
        call printString

		Macro_cursor 11, 10
		mov si, a5
        call printString

		Macro_cursor 13, 10        
		mov si, a6
        call printString

		Macro_cursor 16, 12
        mov si, local_res
        call print_string_delay
        mov di, Resposta
        call gets

        mov di, Resposta
        mov si, R6
        call comp

        cmp dx, 0
    	je .endloop_6
        Video_Mode
		Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
        call print_string_delay
        call delay
        jmp .loop_pergunta_6
    .endloop_6:
        Video_Mode
        Macro_cursor 10, 13
		mov bl, 10
        mov si, Acertou2
        call print_string_delay
        call delay
    
    ret

pergunta7:
 	.loop_pergunta_7:
		Video_Mode
		Macro_cursor 6, 6
		mov bl, 6
	    mov si, Q7_1
		call print_string_delay

        Macro_cursor 8, 4

	    mov si, Q7_2
		call print_string_delay
    
		Macro_cursor 10, 5

        mov si, Q7_3
		call print_string_delay
    
		Macro_cursor 12, 11

		mov si, local_res
		call print_string_delay
		mov di, Resposta
		call gets

		mov di, Resposta
        mov si, R7
		call comp

		cmp dx, 0
		je .endloop_7
		Video_Mode

        Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_7
	.endloop_7:
		Video_Mode
		Macro_cursor 10, 13
		mov bl, 10
		mov si, Acertou2
		call print_string_delay
        call delay
	
	ret

pergunta8:
	.loop_pergunta_8:
		Video_Mode
		Macro_cursor 6, 5
		mov bl, 11
	    mov si, Q8_1
		call print_string_delay

        Macro_cursor 8, 3

	    mov si, Q8_2
		call print_string_delay
    
		Macro_cursor 10, 6

        mov si, Q8_3
		call print_string_delay
    
		Macro_cursor 12, 12

		mov si, local_res
		call print_string_delay
		mov di, Resposta
		call gets

		mov di, Resposta
        mov si, R8_
		call comp

		cmp dx, 0
		je .endloop_8
		Video_Mode

        Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_8
	.endloop_8:
		Video_Mode
		call final
		call final
		call creditos
ret

pergunta9:
	.loop_pergunta_9:
		Video_Mode
		Macro_cursor 8, 9
		mov bl, 6
		mov si, Q9
		call print_string_delay
        call endl

		Macro_cursor 10, 11

		mov si, local_res
		call print_string_delay
		mov di, Resposta
		call gets

		mov di, Resposta
        mov si, R9_
		call comp

		cmp dx, 0
		je .endloop_9
		Video_Mode

		Macro_cursor 10, 3
		mov bl, 12
		mov si, Errou
		call print_string_delay
        call delay
		jmp .loop_pergunta_9
	.endloop_9:
		Video_Mode
		Macro_cursor 10, 13
		mov bl, 10
		mov si, Acertou2
		call print_string_delay
        call delay
ret

creditos:
    Video_Mode

    mov bl, 10
	Macro_cursor 10, 14

    mov si, JoaoVictor
    call print_string_delay
	Macro_cursor 11, 18
	mov si, as
    call print_string_delay
	Macro_cursor 12, 17
	mov si, jvol
    call print_string_delay

    call delay
	Video_Mode

	mov bl, 5; change color font
	Macro_cursor 10, 16
    
	mov si, Rayhene
    call print_string_delay
	Macro_cursor 11, 18
    mov si, as
    call print_string_delay
	Macro_cursor 12, 17
    mov si, rrda
    call print_string_delay

    call delay
    Video_Mode

	mov bl, 0eh
	Macro_cursor 10, 16
    
	mov si, Irineu
    call print_string_delay
	Macro_cursor 11, 18
    mov si, as
    call print_string_delay
	Macro_cursor 12, 17
    mov si, iaps
    call print_string_delay

    call delay
    Video_Mode

	mov bl, 0bh
	Macro_cursor 10, 16
    
	mov si, Pedro
    call print_string_delay
	Macro_cursor 11, 18
    mov si, as
    call print_string_delay
	Macro_cursor 12, 16
    mov si, phagp
    call print_string_delay
	call delay

	;printa a palavra FIM
	Video_Mode
	Macro_cursor 7, 6
    mov si, fim0
	mov bl, 14
    call printString

	Macro_cursor 8, 6
    mov si, fim1
    call printString

	Macro_cursor 9, 6
    mov si, fim2
    call printString

	Macro_cursor 10, 6
    mov si, fim3
    call printString
	
	Macro_cursor 11, 6
    mov si, fim4
    call printString
	
	Macro_cursor 12, 6
    mov si, fim5
    call printString

	Macro_cursor 13, 6
    mov si, fim6
    call printString

ret

;fireworks
fw1: 
	Macro_cursor 10, 10

    mov si, f1_0
    call printString

	Macro_cursor 11, 10

	mov si, f1_1
    call printString

	Macro_cursor 12, 10

    mov si, f1_2
    call printString

	Macro_cursor 13, 10

    mov si, f1_3
    call printString
ret

fw2:

	Macro_cursor 6, 25

    mov si, f2_0
    call printString

	Macro_cursor 7, 25

	mov si, f2_1
    call printString

	Macro_cursor 8, 25

    mov si, f2_2
    call printString

	Macro_cursor 9, 25

    mov si, f2_3
    call printString
ret

fw3:

	Macro_cursor 15, 4

    mov si, f4_0
    call printString

	Macro_cursor 16, 4

	mov si, f4_1
    call printString

	Macro_cursor 17, 4

    mov si, f4_2
    call printString

	Macro_cursor 18, 4

    mov si, f4_3
    call printString
ret

fw4:

	Macro_cursor 15, 25

    mov si, f3_0
    call printString

	Macro_cursor 16, 25

	mov si, f3_1
    call printString

	Macro_cursor 17, 25

    mov si, f3_2
    call printString

	Macro_cursor 18, 25

    mov si, f3_3
    call printString
ret

fw5:

	Macro_cursor 6, 2

    mov si, f2_0
    call printString

	Macro_cursor 7, 2

	mov si, f2_1
    call printString

	Macro_cursor 8, 2

    mov si, f2_2
    call printString

	Macro_cursor 9, 2

    mov si, f2_3
    call printString
ret

;quadro com "parabens" e bonequinhos segurando
parabens:
	Macro_cursor 0, 9
	mov bl, 63
	mov si, quadro0
	call printString

	Macro_cursor 1, 9
	mov si, quadro1
	call printString

	Macro_cursor 2, 9
	mov si, quadro2
	call printString

	Macro_cursor 3, 9
	mov si, quadro3
	call printString

	Macro_cursor 4, 2
	mov si, emj0
	mov bl, 14
	call printString


ret


final:
	.loop_final:
	Video_Mode
	call parabens

	fireworks1 11
	call delay2

	Video_Mode
	call parabens
	fireworks2 15
	call delay2

	Video_Mode
	call parabens
    fireworks3 4
	call delay2

	Video_Mode
	call parabens
	fireworks4 8
	call delay2

	Video_Mode
	call parabens
	fireworks5 5
	call delay2

	Video_Mode
	call parabens
	fireworks1 14
	call delay2

	Video_Mode
	call parabens
	fireworks2 2
	call delay2

	Video_Mode
	call parabens
	fireworks3 3
	call delay2

	Video_Mode
	call parabens
	fireworks4 6
	call delay2

	Video_Mode
	call parabens
	fireworks5 56
	call delay2


ret

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    ;Código do projeto...
	Video_Mode

	Macro_cursor 10, 6

    mov si, inicio
    mov bl, 63
	call print_string_delay
    
	.loop:
		call getchar
		cmp al, ' '
		je .endloop
		jmp .loop
	.endloop:
	
	call pergunta1
	call pergunta2
	call pergunta3
	call pergunta4
	call pergunta5
	call pergunta6
	call pergunta7
	call pergunta9
	call pergunta8

jmp $