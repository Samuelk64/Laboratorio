defmodule Util do

  def ingresar(mensaje,:texto) do
    # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
    {output, 0} ->
      IO.puts("Texto ingresado correctamente.")
      IO.puts("Entrada: #{output}")
      String.trim(output) # Retorna la entrada sin espacios extra
    {error, code} ->
      IO.puts("Error al ingresar el texto. Código: #{code}")
      IO.puts("Detalles: #{error}")
    nil
    end
  end

  def ingresar(mensaje, :entero) do
    try do
    mensaje
    |> ingresar(:texto)
    |> String.to_integer()
    rescue
    ArgumentError ->
    "Error, se espera que ingrese un número entero\n"
    |> mostrar_error()
    mensaje
    |> ingresar(:entero)
    end
  end

  def ingresar(mensaje, :real) do
    try do
    mensaje
    |> ingresar(:texto)
    |> String.to_float()
    rescue
    ArgumentError ->
    "Error, se espera que ingrese un número real\n"
    |> mostrar_error()
    mensaje
    |> ingresar(:real)
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  def mostrar_mensaje(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end

  end
