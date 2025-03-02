#Abstracción
#Que se solicita finalmente:
#: Convertir temperatura en Celsius a Fahrenheit y Kelvin

#Que información es relevante dado el problema anterior?
#-Formula para convertir grados celcius a fahrenheit: °F = (°C * 9/5) + 32
#-Formula para convertir grados celcius a fahrenheit: °K = °C + 273.15

#Descomposición funcional

#-Ingresar el nombre del usuario
#-Ingresar la temperatura en grados celcius
#-Convertir la temperarura a grados fahrenheit y kelvin
#-generar mensaje
#-mostrar mensaje


#Reconociento de patrones
#: Se puede reutilizar los metodos ingresar/2 y mostrar_mensaje/1 del modulo Util
defmodule ConversionUnidades do

def main do

  nombre_usuario = "Ingrese su nombre:"
  |> Util.ingresar(:texto)
  temperatura_celsius = "Ingrese la temperatura en grados Celsius:"
  |> Util.ingresar(:real)


  # Convertir las temperaturas
  temperatura_fahrenheit = convertir_temperatura_fahrenheit(temperatura_celsius)
  temperatura_kelvin     = convertir_temperatura_kelvin(temperatura_celsius)

  # Mostrar el mensaje
  generar_mensaje(nombre_usuario,temperatura_fahrenheit,temperatura_kelvin)
  |> Util.mostrar_mensaje()

end

# Funcion para convertir la temperatura a grados Fahrenheit
defp  convertir_temperatura_fahrenheit(temperatura_celsius) do
  (temperatura_celsius * 9/5) +32
end

# Funcion para convertir la temperatura a grados Kelvin
defp   convertir_temperatura_kelvin(temperatura_celsius) do
  temperatura_celsius + 273.15
end


# Mostrar el mensaje con precision de 1 decimal
defp  generar_mensaje(nombre_usuario,temperatura_fahrenheit, temperatura_kelvin) do
  "Hola #{nombre_usuario}, La temperatura es #{Float.round(temperatura_fahrenheit, 1)}°F y #{Float.round(temperatura_kelvin, 1)}°K."

end

end

ConversionUnidades.main()
