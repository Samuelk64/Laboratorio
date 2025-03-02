#Abstracción
#Que se solicita finalmente:
#:Registrar los libros disponibles de una biblioteca

#Que información es relevante dado el problema anterior?
#-Se debe registrar: nombre, cantidad de unidades disponibles y precio del libro

#Descomposición funcional
#-Ingresar el nombre del libro
#-Ingresar la cantidad de unidades disponibles
#-Ingresar el precio del libro

#Reconociento de patrones
#: Se puede reutilizar los metodos ingresar/2 y mostrar_mensaje/1 del modulo Util

defmodule InventarioLibreria do

  def main do
    titulo_libro = "Ingrese el titulo del libro:"
    |> Util.ingresar(:texto)
    unidades_disponibles = "Ingrese la cantidad de unidades disponibles:"
    |> Util.ingresar(:entero)
    precio = "Ingrese el precio del libro:"
    |> Util.ingresar(:real)

    # Calcular el valor total del inventario
    calcular_valor_inventario(unidades_disponibles,precio)
    |> generar_mensaje(titulo_libro,unidades_disponibles)
    |> Util.mostrar_mensaje()

  end

    # Funcion para mostrar el valor total del inventario
    defp calcular_valor_inventario(unidades_disponibles, precio) do
      unidades_disponibles * precio
    end

    # Funcion para mostrar el mensaje en consola
    defp generar_mensaje(precio,titulo_libro,unidades_disponibles) do
      "El libro #{titulo_libro} tiene #{unidades_disponibles} unidades disponibles con un valor total de #{precio}"

    end

  end

  InventarioLibreria.main()
