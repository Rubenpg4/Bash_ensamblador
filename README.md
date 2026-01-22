# 🐚 Bash - Shell en Ensamblador

Este proyecto es una implementación básica de un shell interactivo escrito enteramente en **Lenguaje Ensamblador (NASM)** para arquitectura x86 16-bits. Está diseñado para ejecutarse en un entorno DOS (como **DOSBox**).

El programa simula el comportamiento de una terminal, permitiendo la entrada de texto por parte del usuario, manejo de cursor y ejecución de comandos básicos mediante atajos de teclado.

---

## 🚀 Características

Este shell minimalista incluye las siguientes funcionalidades:

- **Prompt Interactivo**: Muestra el símbolo `$` esperando la entrada del usuario.
- **Entrada de Texto**: Captura y muestra caracteres en tiempo real utilizando interrupciones de BIOS.
- **Edición de Línea**: Soporte funcional para la tecla **Backspace** (Retroceso), permitiendo borrar caracteres respetando los límites del prompt.
- **Nueva Línea**: Manejo inteligente del cursor al presionar **Enter**, desplazándose a la siguiente línea y mostrando un nuevo prompt.
- **Scroll Infinito**: Al llegar al final de la pantalla, limpia la pantalla automáticamente para continuar (simulando un scroll básico).
- **Limpieza de Pantalla**: Comando rápido (**Ctrl + L**) para limpiar la terminal y resetear el cursor.
- **Salida Segura**: Cierre controlado de la aplicación mediante la tecla **ESC**.

## 🛠️ Requisitos Técnicos

Para ensamblar y ejecutar este proyecto necesitas:

1.  **NASM (Netwide Assembler)**: Para compilar el código fuente.
2.  **DOSBox**: Emulador de DOS para ejecutar el binario `.com` resultante (ya que es un ejecutable de 16 bits).

## ⚙️ Compilación e Instalación

Sigue estos pasos para generar el ejecutable:

### 1. Clonar el repositorio
```bash
git clone <URL-DEL-REPOSITORIO>
cd Bash_ensamblador
```

### 2. Compilar con NASM
Utiliza el siguiente comando para ensamblar el archivo `Practica.asm` y generar el binario `Practica.com`:

```bash
nasm -f bin Practica.asm -o Practica.com
```

> **Nota:** El flag `-f bin` es crucial ya que estamos creando un ejecutable `.com` puro sin cabeceras complejas (modelo de memoria `tiny`).

## 🖥️ Ejecución

### Opción A: Manualmente en DOSBox
1. Abre **DOSBox**.
2. Monta el directorio del proyecto:
   ```dosbox
   mount c /ruta/a/tu/proyecto
   c:
   ```
3. Ejecuta el programa:
   ```dosbox
   Practica.com
   ```

### Opción B: Script Automático (Linux/Bash)
Si tienes configurado el entorno con el script `build.sh` incluido:
```bash
./build.sh
```
*Este script compila el código y lanza DOSBox automáticamente en el directorio actual.*

## 🎮 Guía de Uso y Comandos

Una vez dentro del shell, puedes usar las siguientes teclas:

| Tecla / Comando | Acción |
| :--- | :--- |
| **Teclas Alfanuméricas** | Escribe texto en la pantalla. |
| **Enter** | Salta a la siguiente línea y muestra un nuevo prompt. |
| **Backspace** | Borra el carácter anterior (hasta el límite del prompt). |
| **Ctrl + L** | Limpia toda la pantalla y coloca el cursor al inicio. |
| **ESC** | Cierra el programa y vuelve a DOS. |

## 🧠 Estructura del Código

El núcleo del programa se basa en el manejo directo de **interrupciones de BIOS**:

- **INT 10h**: Utilizada extensively para todo lo relacionado con video y cursor:
    - `AH=0Eh`: Teletype output (escribir caracteres).
    - `AH=03h`: Leer posición del cursor.
    - `AH=02h`: Establecer posición del cursor.
    - `AH=00h`: Establecer modo de video (usado para limpiar pantalla).
- **INT 16h**: Utilizada para la entrada de teclado.
    - `AH=00h`: Leer el siguiente carácter del buffer.
- **INT 21h**: Utilizada para terminar el programa y devolver el control al sistema operativo (`AH=4Ch`).

## 📂 Archivos del Proyecto

- `Practica.asm`: Código fuente principal en ensamblador.
- `Practica.com`: Ejecutable binario (generado tras compilar).
- `build.sh`: Script de utilidad para compilar y ejecutar rápidamente.
- `README.md`: Documentación del proyecto.

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si deseas mejorar este shell (por ejemplo, añadiendo soporte para colores o historial de comandos), por favor:

1. Haz un Fork del proyecto.
2. Crea una rama para tu funcionalidad (`git checkout -b feature/AmazingFeature`).
3. Haz Commit de tus cambios (`git commit -m 'Add some AmazingFeature'`).
4. Haz Push a la rama (`git push origin feature/AmazingFeature`).
5. Abre un Pull Request.

---
*Desarrollado como práctica educativa de programación a bajo nivel.*
