# 🌱 WarmpUp 1 - Configuración local e introducción a Python/Robot Framework

El objetivo de este calentamiento es introducir a los participantes en la automatización de pruebas con un enfoque práctico y progresivo. Iniciaremos con la instalación de Python y Robot Framework, asegurando un entorno de trabajo correcto. Luego, revisaremos los conceptos básicos de Python, esenciales para comprender la lógica de programación aplicada al testing. También exploraremos el API Testing en Postman, entendiendo cómo funcionan los endpoints y cómo validar sus respuestas. Finalmente, se abordará la introducción a Robot Framework y la Requests Library, para estructurar pruebas de APIs reutilizables y escalables, fortaleciendo así el perfil profesional en QA.

## Index

1. [Preparando el Entorno para Python](#Preparando-el-Entorno-para-Python) (Tiempo de lectura/practica: 10 minutos)  
2. [Instalación de IDE](#ide-recomendados)  (Tiempo de practica: 5 minutos)  
3. [Configuracion de ambiente virutal en Python](#configuración-del-ambiente-virtual-y-dependencias) (Tiempo de practica: 15 minutos)  
4. [Introducción a Python](#introducción-a-python--conceptos-básicos-) (Tiempo de lectura/practica: 25 minutos)  
5. [Introducción al API Testing con Postman](#introducción-al-api-testing-con-postman) (Tiempo de lectura/practica: 15 minutos) 
6. [Métodos principales de los servicios web (HTTP Methods)](#métodos-principales-de-los-servicios-web-http-methods) (Tiempo de lectura/practica: 8 minutos) 
7. [Estructura básica de un archivo en Robot Framework](#estructura-básica-de-un-archivo-en-robot-framework)(Tiempo de lectura/practica: 8 minutos) 
8. [Mini desafío](#mini-desafío)(Tiempo de lectura/practica: 35 minutos) 
9. [Tips Ninja For Testing](#-tip-ninja-for-testing)

> ⏱ Tiempo Aproximado = 121 minutos → 2 horas con 1 minuto
---
## Preparando el Entorno para Python

Antes de escribir código para pruebas, necesitamos tener Python listo.

### 🪟 Instalación en Windows:

1. Ir a [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. Descargar la última versión estable.
3. Durante la instalación, **marcar la casilla "Add Python to PATH"**.
4. Verificar instalación:
   ```
      python --version
   ```
### 🍎 Instalación en Mac

1. **Abrir Terminal.**

2. **Instalar Homebrew** (si no lo tienes):

```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew install python
```
3. Verificar instalación:
   ```
      python --version
   ```

### IDE Recomendados

Debes elegir una de las siguientes opciones según tu sistema operativo. En el enlace encontrarás el instalador correspondiente; simplemente descárgalo y sigue los pasos que se indican para completar la instalación.

- [VS Code](https://code.visualstudio.com/Download) → Ligero, extensiones para Python y control de versiones.

- [PyCharm Community Edition](https://www.jetbrains.com/pycharm/download/other.html) → Ideal si quieres un IDE especializado en Python.

Tambien debes instalar el plugin de **Robot Framework Language Server**

### Configuración del Ambiente Virtual y Dependencias
Un ambiente virtual en Python (virtual environment o venv) es un espacio aislado donde puedes instalar y manejar librerías sin que afecten a otras aplicaciones o proyectos en tu computador.

Por defecto, cuando instalas Python, todas las librerías se agregan de manera global al sistema. Esto puede causar conflictos entre proyectos, ya que cada uno puede necesitar versiones diferentes de las mismas dependencias.

Con un ambiente virtual, cada proyecto tiene su propio “mini-Python”, con sus propias librerías y configuraciones. Así, puedes trabajar en varios proyectos al mismo tiempo sin preocuparte de incompatibilidades.

En Python, un ambiente virtual es como tu cocina privada: todo lo que instales ahí no afecta a otras cocinas (proyectos).

1. Crear un ambiente virtual

Para crear un ambiente virtual en Python es importante ubicarse primero en la carpeta donde estará tu proyecto. Esto se hace desde la terminal o línea de comandos, navegando con cd hasta la ruta que elegiste para guardar tu código.
Por ejemplo:

```
cd ruta/del/proyecto

```

```
python -m venv venv
```

2. Activar el ambiente virtual

Después de crearlo, para comenzar a trabajar en tu proyecto necesitas activar el ambiente virtual. Esto le indica a la terminal que use el Python y las librerías que están dentro de ese entorno, y no las globales del sistema.

🪟 En Windows:

```
venv\Scripts\activate
```

🍎 En Mac/Linux:

```
source venv/bin/activate
```

👉 Cuando lo actives, verás el nombre del entorno (por ejemplo (venv)) al inicio de la línea de tu terminal.

3. Instalar dependencias por separado

Una vez activado tu ambiente virtual, es momento de instalar las librerías necesarias para trabajar con Robot Framework y automatización de APIs. En este caso, lo hacemos con dos comandos diferentes, porque cada uno instala una dependencia específica.

Usando Pip, y que es ¿pip?: pip es el administrador de paquetes de Python.
Su nombre viene de “Pip Installs Packages” y es la herramienta que nos permite instalar, actualizar y desinstalar librerías o frameworks que no vienen incluidos en Python por defecto.

```
pip install robotframework
pip install robotframework-requests
```
- pip install robotframework 👉 Descarga e instala Robot Framework, la herramienta principal que usaremos para crear y ejecutar pruebas automatizadas.

- pip install robotframework-requests 👉 Agrega la librería Requests, que permite a Robot Framework interactuar con APIs (enviar peticiones, validar respuestas, manejar autenticación, etc.).

4. Instalar dependencias desde requirements.txt

Otra forma muy práctica de instalar todas las librerías necesarias para tu proyecto es usando un archivo llamado requirements.txt.

👉 Para que esto funcione, primero debes crear el archivo requirements.txt en la raíz de tu proyecto (es decir, en la misma carpeta donde estará tu código principal). Dentro de este archivo se listan, línea por línea, las librerías que quieres instalar.

Ejemplo de un requirements.txt:

```
robotframework==7.3.2
robotframework-requests==0.9.7
```
Luego, desde la terminal (y con tu ambiente virtual activo), instalas todo de una sola vez con:

```
pip install -r requirements.txt
```
### ¿Por qué es útil?

Permite compartir fácilmente las dependencias de un proyecto con otras personas (solo necesitan ejecutar ese comando).

Facilita la organización de librerías, especialmente cuando un proyecto crece y requiere muchas dependencias.

Es ideal para proyectos en equipo o cuando subes tu código a GitHub.

5. Guardar dependencias actuales en un requirements.txt

```
pip freeze > requirements.txt

```
👉 Lo que hace es listar todas las librerías y versiones que tienes instaladas en tu ambiente virtual y guardarlas dentro de un archivo llamado requirements.txt.

### ¿Por qué es útil?

Te permite documentar exactamente qué dependencias usa tu proyecto.

Facilita compartir el proyecto con otras personas: solo deben ejecutar pip install -r requirements.txt para tener el mismo entorno.

Es clave cuando subes un proyecto a GitHub o trabajas en equipo, ya que garantiza que todos los automatizadores tengan las mismas versiones de librerías.

6. Desactivar el ambiente virtual

Cuando terminas de trabajar en tu proyecto, es recomendable desactivar el ambiente virtual para volver al entorno global de Python. Esto se hace simplemente con el comando:

```
deactivate

```
👉 Al ejecutar ese comando, la terminal deja de usar el Python y las librerías del entorno virtual, y regresa al Python instalado en tu sistema.

## Introducción a Python – Conceptos Básicos 🐍

Python es un lenguaje de programación de alto nivel, interpretado, fácil de leer y ampliamente utilizado en **automatización, análisis de datos y desarrollo web**.  
En este módulo revisaremos los conceptos fundamentales que todo tester que quiera automatizar debe conocer.

---
### 1. ¿Cómo ejecutar un archivo Python desde la consola?  

1. Crear un archivo .py

ejemplo hola.py

2. Navegar hasta la carpeta

En la consola, usa el comando cd para ir a la carpeta donde guardaste el archivo:

cd ruta/de/tu/carpeta

3. Ejecutar el archivo

Escribe:
```
python hola.py
```

👉 La consola debería mostrar el resultado

###  2. Tipos de datos principales
En Python, los tipos de datos son como las diferentes cajas en las que guardamos información.
Cada caja tiene un propósito: una sirve para números, otra para texto, otra para listas de cosas, etc.

| Tipo de dato | Ejemplo | Descripción |
|--------------|---------|-------------|
| `int`        | 10      | Enteros |
| `float`      | 3.14    | Números decimales |
| `str`        | "Hola"  | Cadenas de texto |
| `bool`       | True    | Booleanos (`True` o `False`) |
| `list`       | [1,2,3]| Listas ordenadas y mutables |
| `tuple`      | (1,2,3)| Tuplas ordenadas e inmutables |
| `dict`       | {"nombre":"Ana", "edad":25} | Diccionarios con pares clave-valor |

![Tipo de datos principales](/Assets/Stage_1/WarmUp/Tipos_de_datos_en_Python.png)

### 3. Inicialización de variables
Una variable es como una etiqueta que le pones a una caja para recordar qué guardaste allí.
En Python no tienes que decir de qué tipo es la caja, Python lo adivina por lo que pongas dentro.

```python
edad = 25          # int
nombre = "Juan"    # str
precio = 19.99     # float
activo = True      # bool
```

### 4. Funciones principales de Python  

Una **función** es como una **herramienta** que ya viene lista en Python para ayudarte a hacer algo sin tener que reinventar la rueda.  
Por ejemplo: si quieres mostrar un mensaje en la pantalla, existe la función `print()`.  

Aquí te dejo las más importantes para empezar:  

| Función | Ejemplo | Explicación |
|---------|---------|-------------|
| `print()` | `print("Hola Mundo")` | Muestra un mensaje o valor en la pantalla. Es como "hablar con el usuario". |
| `type()`  | `type(10)` → `<class 'int'>` | Te dice qué tipo de dato tiene una variable o valor. |
| `len()`   | `len("Python")` → `6` | Devuelve la longitud (cantidad de elementos) de una cadena, lista, etc. |
| `input()` | `nombre = input("¿Cómo te llamas? ")` | Permite al usuario escribir algo en la consola. |
| `int()` / `float()` / `str()` | `int("25")` → `25` | Convierte valores a número entero, decimal o texto. |
| `max()` / `min()` | `max(5, 10, 2)` → `10` | Devuelve el número mayor o menor de un conjunto. |
| `sum()` | `sum([1, 2, 3])` → `6` | Suma todos los elementos de una lista. |

---

#### **Ejemplo práctico paso a paso**  

```python
# 1. Mostrar un mensaje
print("Bienvenido a Python")

# 2. Saber el tipo de dato
x = 3.14
print(type(x))   # → <class 'float'>

# 3. Contar letras
palabra = "automatización"
print(len(palabra))  # → 14

# 4. Pedir datos al usuario
nombre = input("¿Cuál es tu nombre? ")
print("Hola", nombre)

# 5. Conversiones
numero_texto = "42"
numero_entero = int(numero_texto)
print(numero_entero + 10)  # → 52

# 6. Funciones matemáticas
numeros = [5, 12, 3, 7]
print("Mayor:", max(numeros))   # → 12
print("Menor:", min(numeros))   # → 3
print("Suma:", sum(numeros))    # → 27
```
## Introducción al API Testing con Postman  

El **API Testing** (pruebas de APIs) consiste en verificar que los servicios que exponen los sistemas (normalmente en formato **REST** o **SOAP**) funcionen correctamente.  
Con este tipo de pruebas comprobamos que los **endpoints** (rutas URL que responden a peticiones) devuelvan lo esperado: datos correctos, tiempos adecuados y errores bien gestionados.  

Una de las herramientas más usadas para esto es **Postman**.  

---

### 1. Instalación de Postman  

Tienes dos formas de usar Postman:  

### 🔹 Opción 1: Aplicación de escritorio  
1. Ve a la página oficial: [postman](https://www.postman.com/downloads/)  
2. Descarga la versión para tu sistema operativo (Windows, Mac o Linux).  
3. Instala la aplicación y crea una cuenta gratuita (necesaria para guardar colecciones en la nube).  

### 🔹 Opción 2: Cliente Online (sin instalar nada)  
1. Ingresa a [a la version web](https://identity.getpostman.com/signup?continue=https%3A%2F%2Fgo.postman.co%2Fhome)
2. Haz clic en **Sign In** o **Sign Up** para registrarte.  
3. Podrás usar Postman directamente en tu navegador con las mismas funcionalidades principales.  

---

### 2. Crear tu primer request  

Un **request** es una solicitud que haces a una API (ejemplo: pedir usuarios, crear un registro, etc.).  

1. Abre Postman.  
2. Haz clic en **New → HTTP Request**.  

![Crear nuevo request](/Assets/Stage_1/WarmUp/new_request.png)

3. Elige el método HTTP (ejemplo: `GET`, `POST`, `PUT`, `DELETE`).  
4. Escribe la URL de la API. Ejemplo: https://jsonplaceholder.typicode.com/posts
5. Haz clic en **Send**.  
6. Verás la respuesta de la API en la parte inferior (normalmente en formato **JSON**).  

5. Haz clic en **Send**.  
6. Verás la respuesta de la API en la parte inferior (normalmente en formato **JSON**).  

---

### 3. Importar una colección en Postman  

Una **colección** es un conjunto de requests organizados (por ejemplo: login, creación de usuario, eliminación, etc.).  
Esto permite compartir pruebas fácilmente dentro de un equipo.  

### Pasos para importar una colección:  
1. Descarga o copia el enlace de la colección (generalmente un archivo `.json`).  
2. En Postman, haz clic en **Import** (arriba a la izquierda).  
3. Selecciona el archivo `.json` o pega el link de la colección.  
4. Haz clic en **Import**.  
5. Verás la colección lista en el panel lateral, lista para ejecutar las pruebas.  


![Importar nueva colección](/Assets/Stage_1/WarmUp/new_collection.png)

## Métodos principales de los servicios web (HTTP Methods)


Cuando probamos o consumimos un servicio web (API), usamos **métodos HTTP**.  
Estos métodos son como **acciones** que le pedimos al servidor que ejecute sobre un recurso (ejemplo: usuarios, productos, pedidos).  

---

###  1. GET
- **¿Qué hace?**  
  Sirve para **consultar información** de un recurso.
- **Ejemplo de la vida real:**  
  Como preguntar en una librería: *"¿Tienen el libro X?"*
- **Ejemplo en API:**  
```
GET /usuarios
GET /usuarios/5
```
- **Postman:** No necesita body, solo la URL.

### 2. POST
- **¿Qué hace?**  
Sirve para **crear un nuevo recurso** en el servidor.
- **Ejemplo de la vida real:**  
Como llenar un formulario para registrarte en una página.
- **Ejemplo en API:**  
```
POST /usuarios
Body: {
"nombre": "Ana",
"edad": 25
}
```
- **Resultado esperado:** Se crea un usuario nuevo y normalmente devuelve un código **201 Created**.
### 3. PUT
- **¿Qué hace?**  
Sirve para **reemplazar o actualizar completamente** un recurso.
- **Ejemplo de la vida real:**  
Como cambiar toda tu hoja de datos en una oficina (ponen una nueva en lugar de la vieja).
- **Ejemplo en API:**  

```
PUT /usuarios/5
Body: {
"nombre": "Ana María",
"edad": 26
}

```

- **Resultado esperado:** Se reemplaza toda la información del usuario con id=5.


### 4. PATCH
- **¿Qué hace?**  
Sirve para **actualizar parcialmente** un recurso (solo un campo o algunos).
- **Ejemplo de la vida real:**  
Como corregir solo tu número de celular en un formulario sin cambiar lo demás.
- **Ejemplo en API:**  
```
PATCH /usuarios/5
Body: {
"edad": 27
}
```
- **Resultado esperado:** Solo se actualiza la edad, el resto de datos permanecen iguales.

### 5. DELETE
- **¿Qué hace?**  
Sirve para **eliminar un recurso**.
- **Ejemplo de la vida real:**  
Como dar de baja tu cuenta en una red social.
- **Ejemplo en API:**  
```
DELETE /usuarios/5
```
- **Resultado esperado:** El servidor elimina el usuario con id=5.

![Metodo HTTP](/Assets/Stage_1/WarmUp/metodo_http.png)

## Estructura básica de un archivo en Robot Framework   
Un archivo de Robot Framework se organiza en **secciones**. Cada sección comienza con un encabezado rodeado de tres asteriscos (`***`). Estas son las principales:  

---

###  Settings  
Aquí defines la **configuración** de tu suite de pruebas:  
- Librerías que vas a usar (`Library`).  
- Recursos compartidos (`Resource`).  
- Variables globales (`Variables`).  
- Configuraciones generales (como `Suite Setup` o `Suite Teardown`).  

### Variables  
Sección donde se declaran **valores reutilizables** que facilitan el mantenimiento y evitan la duplicación de datos dentro de las pruebas.  

### Test Cases  
Sección en la que se escriben los **casos de prueba**. Cada caso incluye un nombre descriptivo y una secuencia de pasos definidos con keywords.  

### Keywords  
Sección dedicada a la creación de **keywords personalizados**. Permite encapsular lógica y pasos repetitivos para hacer que las pruebas sean más legibles, organizadas y reutilizables.  

![Estructura Basica de un archivo Robot](/Assets/Stage_1/WarmUp/estructura_basica_robot_framework.png)

---



## Mini desafío

Los mini desafíos están diseñados para que pongas en práctica conceptos clave de automatización y testing de manera rápida y enfocada. No son proyectos largos, sino ejercicios concretos que te ayudarán a reforzar habilidades y a perder el miedo a la práctica.

### 1. Python 🐍
Objetivo: practicar inicialización de variables, tipos de datos y funciones básicas (print, type, len, input).

   #### Instrucciones:

   1. Crea un archivo llamado mi_ficha.py.

   2. Dentro, guarda tu información en variables:

      - Tu nombre (str)

      - Tu edad (int)

      - Si estás estudiando automatizacion en apis (bool)

      - Tu lista de hobbies (list)

   3. Muestra la información en pantalla con print().

   4. Usa type() para imprimir el tipo de cada variable.

   5. Pregunta al usuario con input() cuál es su hobby favorito y agrega ese hobby a tu lista.

   6. Muestra cuántos hobbies hay en total usando len().

   7. Cambiar el valor de edad sumándole 1 (como si hubieras cumplido años) y vuelve a mostrarlo en pantalla.

### 2. Postman 📨

Objetivo: familiarizarse con el flujo de trabajo de importar colecciones y ejecutar requests.

#### Instrucciones:

En la carpeta `Assets/Stage_1/WarmUp`, busca el archivo [stage_1_warmup_qax.json.](/Assets/Stage_1/WarmUp/stage_1_warmup_qax.json)

1. Abre Postman en tu máquina o en el cliente web

2. Haz clic en Import (arriba a la izquierda).

3. Selecciona Upload Files y carga el archivo warmup_collection.json.

4. Verifica que la colección Api Testing - QAXPERT aparece en tu panel izquierdo.

Ejecuta al menos una petición de la colección para confirmar que la importación fue exitosa.


## 💡 **Tip Ninja For Testing:**  

- En Postman, usa **variables de entorno** para cambiar fácilmente entre `dev`, `qa` y `prod`.  

- Siempre valida el **status code** (200, 201, 400, 404, 500) en tus pruebas de APIs.  

- En programación, una **variable** es solo un nombre que guarda un valor: `edad = 25`.  

- Los **tipos de datos** más comunes son: `string`, `int`, `float`, `bool`, `list` y `dict`.  

- Los métodos de API más usados son:  
  - `GET` → Consultar información  
  - `POST` → Crear un recurso  
  - `PUT/PATCH` → Actualizar un recurso  
  - `DELETE` → Eliminar un recurso  

- En Python, usa `print()` para mostrar resultados y `type()` para ver el tipo de una variable.  

- En Postman puedes escribir pequeños **tests en JavaScript** para validar respuestas automáticamente.  

### 👈 Volver al [Stage 1](../README.md)
