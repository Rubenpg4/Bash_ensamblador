# Bash_ensamblador
Este programa en ensamblador se ejecuta en un entorno DOSBox y ofrece un shell interactivo básico con funcionalidades especiales. Al ejecutarlo, los usuarios pueden ingresar texto y hacer uso de teclas especiales para realizar diferentes acciones. Se hace uso de interrupciones de lectura 10h, y de escritura 16h

## Funcionalidades
- **Prompt**: Muestra un símbolo de prompt ($) para indicar que el shell está listo para recibir mensajes.
- **Lectura de Entrada**: Espera la entrada del usuario y muestra los caracteres ingresados en pantalla.
- **Retroceso**: Permite borrar caracteres uno a uno hacia atrás al presionar Backspace, respetando la posición del prompt.
- **Comando Clear**: Limpia la pantalla al presionar Ctrl + L.
- **Nueva Línea**: Al presionar Enter, mueve el cursor a una nueva línea, iniciado por el prompt.
- **Salir**: Termina el programa al presionar ESC.

## Como compilar
Con este comando podriamos compilar nuestro progrma para despues ejecutarlo con Dosbox:
- nasm -f bin Practica.asm -o Practica.com
