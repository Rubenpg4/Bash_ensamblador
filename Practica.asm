ORG 100h

start:
	MOV AH, 0 
    MOV AL, 03h 
	INT 10h

printPrompt:
    MOV AH, 0Eh ; Función para mostrar un caracter
    MOV AL, '$' ; Elegimos el caracter '$'
    INT 10h      
	
	MOV AL, '' ; Elegimos el caracter ''
    INT 10h      
	
mainLoop:
    MOV AH, 00h  ; Función para leer tecla
    INT 16h  
	
	CMP AL, 12 ; Verificamos si es la tecla Ctrl + l (código 12) 
	JE clear
	
	CMP AL, 3; Verificamos si es la tecla Ctrl + c (código 3)
	;JE changeColor
	
    CMP AL, 13 ; Verificamos si es la tecla Enter (código 13)
    JE newLine ; Si es Enter, salta a nueva línea
	
    CMP AL, 27 ; Verificamos si es la tecla ESC (código 27)
    JE exit ; Si es ESC, termina el programa
	
	CMP AL, 8 ; Verificamos si es la tecla Retroceso (código 8)
    JE backspace
	
    MOV AH, 0Eh ; Función para mostrar tecla
    INT 10h   
	
    JMP mainLoop ; Repite el bucle
	
backspace:
    MOV AH, 03h ; Obtener la posición actual del cursor
    INT 10h
	
    CMP DL, 2 ; Comprueba si el cursor está justo después del prompt
    JLE mainLoop ; Si es así, no hace nada y vuelve al bucle principal

    DEC DL ; Mueve el cursor una columna hacia atrás
    MOV AH, 02h ; Establecer la posición del cursor
    INT 10h
	
    MOV AH, 0Eh ; Función para mostrar un caracter
    MOV AL, ' ' ; Escribe un espacio para borrar el carácter
    INT 10h
	
    MOV AH, 02h ; Mueve el cursor hacia atrás de nuevo después de borrar
    INT 10h
	
    JMP mainLoop


newLine:
    MOV AH, 03h ; Función para obtener la posición del cursor
    INT 10h 

    INC DH ; Incrementa DH para mover el cursor a la línea siguiente
    CMP DH, 25 ; Comprueba si hemos llegado al final de las filas
    JL notEnd
    JMP clear

notEnd:
    MOV DL, 0 ; Reinicia la columna a 0
    MOV AH, 02h ; Función para establecer la posición del cursor
    INT 10h         
    JMP printPrompt 
	
clear:
	MOV AH, 0 ; Función para establecer modo de vídeo
    MOV AL, 03h ; Modo de texto 80x25
    INT 10h 
    JMP printPrompt

exit:
    MOV AH, 4Ch ; Función para terminar programa
    INT 21h   
