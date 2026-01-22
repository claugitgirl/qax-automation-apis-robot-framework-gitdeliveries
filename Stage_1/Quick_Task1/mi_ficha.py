# 2. Guardar información en variables.

nombre = "Clau"
edad = 30
estudia_automatizacion_apis = True
hobbies = ["yoga", "programar", "escuchar música"]

# 3. Mostrar la información en pantalla.

print("Nombre:", nombre)
print("Edad:", edad)
print("Estudia automatización en APIs:", estudia_automatizacion_apis)
print("Hobbies:", hobbies)

# 4. Usa Type() para imprimir el tipo de cada variable.

print("\nTipos de datos:")
print("Tipo de nombre:", type(nombre))
print("Tipo de edad:", type(edad))
print("Tipo de estudia_automatizacion_apis:", type(estudia_automatizacion_apis))
print("Tipo de hobbies:", type(hobbies))

# 5. Pregunta al usuario con input() cual es su hobby favorito y agregalo a tu lista.
hobby_favorito = input("\n¿Cuál es tu hobby favorito? ")
hobbies.append(hobby_favorito)

# 6. Muestra cuántos hobbies hay en total usando len()
print("Cantidad total de hobbies:", len(hobbies))

# 7. Cambia el valor de edad sumandole 1 (cumpleaños) y muestra en la pantalla.
edad += 1
print("Nueva edad después de cumplir años:", edad)