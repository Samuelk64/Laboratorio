#Abstracción
#Que se solicita finalmente: Mostrar el salario de un empleado según sus horas extras

#Que información es relevante dado el problema anterior?
#-Cada hora extra se paga al 1.5
#-Es necesario solicitar el valor de cada hora, para poder calcular el valor de una hora extra

#Descomposición funcional
#-Ingresar nombre del empleado
#-Ingresar salario del empleado (base)
#-Ingresar cantidad de horas extras trabajadas
#-Ingresar el valor en pesos de cada hora laboral
#-calcular salario final
#-mostrar mensaje

#Reconociento de patrones
#: Se puede reutilizar los metodos ingresar/2 y mostrar_mensaje/1 del modulo Util



defmodule Salario do
  def main do
    nombre_empleado = "Ingrese el nombre del empleado: "
    |> Util.ingresar(:texto)
    salario_base = "Ingrese el salario base del empleado"
    |> Util.ingresar(:real)
    horas_extras = "Ingrese la cantidad de horas extras trabajadas"
    |> Util.ingresar(:entero)
    valor_hora = "Ingrese el valor en pesos de cada hora"
    |>Util.ingresar(:entero)

    calcular_total_salario(valor_hora,salario_base,horas_extras)
    |> generar_mensaje(nombre_empleado)
    |> Util.mostrar_mensaje()

  end

  defp calcular_total_salario(valor_hora,base,extras) do
    valor_horas = valor_hora * 1.5
    pago = valor_horas * extras
    base + pago
  end

  defp generar_mensaje(total_salario,nombre_empleado) do
    "#{nombre_empleado} Su salario total es de #{total_salario}"
  end

end

Salario.main()
