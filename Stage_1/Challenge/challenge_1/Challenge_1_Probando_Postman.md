# Testing Apis en Postman
En este reto vamos a practicar la automatización y prueba de APIs usando la plataforma **[ReqRes](https://reqres.in/)**, una API pública para pruebas de usuarios y autenticación.  
El objetivo es que los estudiantes construyan sus propios casos de prueba en **Postman**, explorando tanto operaciones de lectura (GET) como de escritura (POST) y validando respuestas de manera práctica.

---

### Historia de Usuario
**Como** tester de APIs,  
**Quiero** poder listar usuarios, registrar nuevos usuarios y realizar login en el sistema de prueba,  
**Para** asegurarme de que la API funcione correctamente y que los datos de usuario sean consistentes.

---

###  Criterios de Aceptación
1. **Listar usuarios**:
    - GET `/api/users` debe devolver HTTP 200.
    - La lista de usuarios no debe estar vacía y cada usuario debe contener `id`, `first_name`, `last_name` y `email`.

2. **Registro de usuario**:
    - POST `/api/register` con payload válido devuelve HTTP 200.
    - La respuesta debe incluir un `id` y un `token`.

3. **Login de usuario**:
    - POST `/api/login` con credenciales válidas devuelve HTTP 200.
    - La respuesta debe contener un `token` para autenticación.

---

### Instrucciones
Usando **Postman** como herramienta de prueba, construye **tres casos de prueba** basados en la historia de usuario y criterios de aceptación:

1. Realizar los casos de prueba en lenguaje Gherkin en un archivo ***.md***
2. Crear una colección en postman para la ejecución de cada caso
3. Exportar la colección del postman
4. Subir todo en la carpeta  ***./Delivery**

**Mensaje para el estudiante:**
> "Usa esta historia de usuario como guía para crear tus propios casos de prueba en Postman. Asegúrate de validar códigos HTTP, revisar campos obligatorios en la respuesta y anotar cualquier comportamiento inesperado. Una vez que tengas los tests funcionando, estarás listo para automatizarlos usando Request Library ."

### 👈 Volver al [Training](./README.md)