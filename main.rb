# frozen_string_literal: true

require_relative './el_juego_de_la_.vida'

def obtener_parametro(nombre)
  parametro = 0

  loop do
    print "Cantidad de #{nombre} (debe ser mayor a 0): "
    parametro = gets.chomp.to_i

    raise ArgumentError unless parametro.positive?

    break
  rescue ArgumentError
    puts 'El valor especificado no es un entero positivo.'
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

# tablero = Tablero.new(columnas, filas)
# tablero.imprimir_tablero
# puts ''
# tablero.calcular_siguiente_generacion
# tablero.imprimir_tablero
