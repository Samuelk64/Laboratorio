#Abstracción
#Que se solicita finalmente:
#: Calcular el consumo de combustible de un vehiculo

#Que información es relevante dado el problema anterior?
#-El rendimiento de un vehiculo se calcula con la formula: distancia/litros


#Descomposición funcional
#-Ingresar el nombre del conductor
#-Ingresar la distancia recorrida
#-Ingresar la cantidad de combustible del vehiculo
#-Calcular rendimiento
#-Generar mensaje
#-Mostrar mensaje

#Reconociento de patrones
#: Se puede reutilizar los metodos ingresar/2 y mostrar_mensaje/1 del modulo Util

defmodule ConsumoCombustible do

  def main do
    nombre_conductor = "Ingrese el nombre del conductor:"
    |> Util.ingresar(:texto)
    distancia = "Ingrese la distancia recorrida en kilometros:"
    |> Util.ingresar(:real)
    litros = "Ingrese la cantidad de combustible consumida en litros:"
    |> Util.ingresar(:real)

    calcular_rendimiento(distancia, litros)
    |> generar_mensaje(nombre_conductor)
    |> Util.mostrar_mensaje()
  end

   # Funcion para calcular el rendimiento del vehiculo en km/l
   defp calcular_rendimiento(distancia, litros) do
    distancia / litros
  end

  # Funcion para mostrar el mensaje en consola
  defp generar_mensaje(rendimiento,nombre_conductor) do
    "El conductor #{nombre_conductor} tiene un rendimiento de #{rendimiento} km/l"
  end

end

ConsumoCombustible.main()
