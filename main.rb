# frozen_string_literal: true

require_relative './el_juego_de_la_.vida'

def obtener_parametro(nombre)
  parametro = 0

  loop do
    print "Cantidad de #{nombre} (debe estar entre 5 y 20): "
    parametro = gets.chomp.to_i

    raise ArgumentError unless parametro.between?(5, 20)

    break
  rescue ArgumentError
    puts 'El valor especificado no es un entero positivo entre 5 y 20.'
  end

  parametro
end

def limpiar_consola
  if Gem.win_platform?
    system('cls')
  else
    system('clear')
  end
end

puts '¡Hola! Bienvenido al Juego de la Vida de Conway.'
puts 'Especifique el tamaño de su tablero.'
puts ''

filas = obtener_parametro('filas')
columnas = obtener_parametro('columnas')
cantidad_celulas_iniciales = rand(5...filas * columnas)
limpiar_consola

tablero = Tablero.new(columnas, filas, cantidad_celulas_iniciales)
loop do
  tablero.imprimir_tablero
  sleep 0.8
  limpiar_consola
  tablero.calcular_siguiente_generacion
end
