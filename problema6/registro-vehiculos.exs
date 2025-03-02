#Abstracción
#Que se solicita finalmente:
#:Registrar la información de un vehiculo

#Que información es relevante dado el problema anterior?
#-Cada vehiculo tiene un valor diferente de tarifa (carro:5000,moto:10000,camion:20000)
#-El precio de el camion es variable según su peso (2000 por cada kilo extra)

#Descomposición funcional

#-Ingresar la placa del vehiculo
#-Ingresar el tipo de vehiculo
#-Ingresar el peso del vehiculo
#-Registrar información del vehiculo
  #-Calcular la tarifa final del vehiculo
#-Generar mensaje con la información almacenada
#-Mostrar mensaje en pantalla

#Reconociento de patrones
#: Se puede reutilizar los metodos ingresar/2 y mostrar_mensaje/1 del modulo Util

defmodule RegistroVehiculos do
  def main do
    placa = "ingrese la placa del vehiculo: "
    |> Util.ingresar(:texto)
    tipo = "ingresar el tipo de vehiculo:  (carro, moto, camion)"
    |> Util.ingresar(:texto)
    peso = "ingrese el peso del vehiculo (kilos): "
    |> Util.ingresar(:real)

    registrar_informacion(placa,tipo,peso)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp registrar_informacion(placa_vehiculo,tipo_vehiculo,peso_vehiculo) do
    valor = calcular_tarifa(tipo_vehiculo,peso_vehiculo)
    {placa_vehiculo,tipo_vehiculo,valor}

  end

  defp calcular_tarifa(tipo,peso) do
    case tipo do
      "carro" -> 10000
      "moto" -> 5000
      "camion" -> 20000 * peso
    end
  end


  defp generar_mensaje(informacion) do
    {placa,tipo,tarifa} = informacion
    "Registrado: {#{placa}, #{tipo}, #{tarifa}}"
  end
end

RegistroVehiculos.main()
