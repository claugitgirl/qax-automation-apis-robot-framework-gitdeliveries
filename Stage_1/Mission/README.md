# Mission: Automatización de APIs – Dog API 🐶
En esta misión vamos a explorar la **Dog API** ([Doc Apis](https://dogapi.dog/docs/api-v2)), una API pública que proporciona información sobre razas, grupos y datos curiosos de perros.  
El objetivo es que los participantes aprendan a transformar una historia de usuario y sus criterios de aceptación en **casos de prueba claros**, ejecutarlos primero manualmente en **Postman** y luego automatizarlos usando **Robot Framework + Requests Library**.

Al finalizar esta misión, los participantes podrán:
- Construir casos de prueba basados en criterios de aceptación.
- Validar respuestas de endpoints públicos en Postman.
- Automatizar pruebas con Robot Framework siguiendo buenas prácticas.

---

## Historia de Usuario
**Como** usuario de la aplicación de perros municipal,  
**Quiero** consultar información sobre razas de perros, grupos de razas y curiosidades,  
**Para** garantizar que los datos sean correctos y consistentes en los distintos endpoints de la API.

---

### Criterios de Aceptación

Para el endpoint `/breeds`, cada objeto de raza debe cumplir con los siguientes criterios:

1. **Campo `id`**
    - Debe existir y ser un string UUID válido.

2. **Campo `type`**
    - Debe existir y ser igual a `"breed"`.

3. **Campo `attributes.name`**
    - Debe existir y ser un string no vacío.

4. **Campo `attributes.description`**
    - Debe existir y ser un string descriptivo.

5. **Campo `attributes.hypoallergenic`**
    - Debe ser un valor booleano (`true` o `false`).

6. **Campo `attributes.life`**
    - Debe contener `min` y `max` como enteros.
    - Valores permitidos: `min` ≥ 10, `max` ≤ 20.

7. **Campos `attributes.male_weight` y `attributes.female_weight`**
    - Deben contener `min` y `max` como enteros.
    - Los rangos deben ser **iguales para macho y hembra**:
      ```
      male_weight.min == female_weight.min
      male_weight.max == female_weight.max
      ```

8. **Campo `relationships.group.data`**
    - Debe contener `id` como string y `type` igual a `"group"`.

9. **Raza existente**
    - Al consultar la raza por su `id` usando `/breeds/{id}`:
        - Si el `id` corresponde a una raza existente, el sistema **debe devolver código HTTP 200**.
        - La respuesta debe incluir el `id` solicitado y toda la información asociada (`name`, `description`, `life`, `weight`, `hypoallergenic`, `group`).

10. **Raza inexistente**
    - Al consultar la raza por su `id` usando `/breeds/{id}`:
        - Si el `id` no corresponde a ninguna raza, el sistema **debe devolver código HTTP 404**.
        - La respuesta puede incluir un mensaje indicando que la raza no fue encontrada.

---

## 💡 **Instrucciones:**

1. Construir los casos de prueba que cubran todos los criterios de aceptación, en Gherkin
2. Probar los casos primero en **Postman** para validar manualmente la respuesta de los endpoints.
3. Automatizar los mismos casos usando **Robot Framework + Requests Library**, siguiendo buenas prácticas:
    - Validar códigos HTTP.
    - Verificar campos obligatorios en las respuestas.
    - Manejar listas de datos y propiedades anidadas (`attributes`, `relationships`).
4. Subir archivo .robot, reporte de ejecucion y colección en postman a la carpeta ./Delivery

**Mensaje para el aprendiz:**
> "Primero prueba los endpoints en Postman para familiarizarte con la estructura de la API. Luego automatiza los tests en Robot Framework, transformando cada caso de prueba manual en un test reproducible y confiable. Recuerda validar tanto códigos de estado como los campos importantes de cada respuesta."

---

## 💡 Tip importante
Para construir tus casos de prueba correctamente, siempre guíate por la **documentación oficial de la API** disponible en Swagger.  
En el caso de la **Dog API**, consulta todos los endpoints, parámetros, estructuras de respuesta y códigos HTTP esperados aquí: [Dog API Swagger](https://dogapi.dog/api/v2/api-docs/v2/swagger.json).

Esto te permitirá:
- Entender la estructura de los endpoints y las relaciones entre recursos.
- Verificar los campos obligatorios y sus tipos.
- Diseñar casos de prueba precisos y evitar errores por suposiciones incorrectas.
- Automatizar tests de manera confiable en Postman y Robot Framework.


### 👈 Volver al [Stage 1](../README.md)
