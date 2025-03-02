#Abstracción
#Que se solicita finalmente:
#:Calcular el costo de enviar un paquete

#Que información es relevante dado el problema anterior?
#-Hay 3 tipos de envios: (Economico,Express,Internacional)
#-Por cada tipo de envio se cobra una tarifa:(Economico:5000,Express:8000,Internacional:12000-15000) por kilo
  #-En envio internacional, si el peso <= 5kg se cobra 15000, si es > 5kg se cobra 12000 por kilo
#Descomposición funcional
#-Ingresar el nombre del cliente
#-Ingresar el peso del paquete
#-Ingresar el tipo de envio
#-Calcular precio total del envio
#-Generar un mensaje
#-Mostar el mensaje generado en pantalla

#Reconociento de patrones
#: Se puede reutilizar los metodos ingresar/2 y mostrar_mensaje/1 del modulo Util

defmodule CostoEnvio do
  def main do
    nombre = "ingresar el nombre del cliente: "
    |> Util.ingresar(:texto)
    peso = "ingresar el peso del paquete (kg): "
    |> Util.ingresar(:real)
    tipo_envio = "ingresar el tipo de envio (Economico, Express, Internacional): "
    |> Util.ingresar(:texto)

    calcular_precio(peso,tipo_envio)
    |> generar_mensaje(nombre,peso,tipo_envio)
    |> Util.mostrar_mensaje()
  end

  defp calcular_precio(peso,tipo) do
    case tipo do
      "economico" -> 50 * peso
      "express" -> 80 * peso
      "internacional" -> verificar_peso(peso) * peso
    end
  end

  defp verificar_peso(peso) do
    if peso <=5 do
      cond do
        peso <= 0 -> CostoEnvio.main()
        peso > 0 -> valor = 150
      end
    else
      valor = 120
    end
  end

  defp generar_mensaje(precio,cliente,tipo,envio) do
    "{#{cliente},#{tipo},#{envio},#{precio}}"
  end
end

CostoEnvio.main()
