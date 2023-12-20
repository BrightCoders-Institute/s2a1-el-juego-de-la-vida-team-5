# frozen_string_literal: true

# Clase para controlar un tablero de n*m
# casillas para el juego de la vida.
class Tablero
  CARACTER_CELULA_VIVA = '+'
  CARACTER_CELULA_MUERTA = '.'
  attr_reader :tablero

  def initialize(filas, columnas)
    @filas = filas
    @columnas = columnas
    @tablero = [[0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0, 0],
                [0, 0, 0, 1, 1, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0]]
  end

  def 

  def calcular_siguiente_generacion
    @tablero = @tablero.each_with_index.map do |fila, i|
      fila.each_with_index.map do |celula, j|
        definir_estado_celula(celula, contar_vecinos(i, j))
      end
    end
  end

  def definir_estado_celula(celula, numero_vecinos)
    if celula == 1
      numero_vecinos.between?(2, 3) ? 1 : 0
    elsif celula.zero?
      numero_vecinos == 3 ? 1 : 0
    end
  end

  def contar_vecinos(fila, columna)
    contar_vecinos_fila(obtener_fila(fila - 1), columna) +
      contar_vecinos_fila(@tablero[fila].map.with_index { |celula, i| i == columna ? 0 : celula }, columna) +
      contar_vecinos_fila(obtener_fila(fila + 1), columna)
  end

  def obtener_fila(fila)
    fila.between?(0, @filas - 1) ? @tablero[fila] : []
  end

  def contar_vecinos_fila(vecinos, columna)
    return 0 if vecinos.empty?

    primera_columna = (columna - 1).negative? ? 0 : columna - 1
    ultima_columna = columna + 1 >= @columnas ? @columnas - 1 : columna + 1

    vecinos_celula = vecinos.select.with_index do |_vecino, i|
      i.between?(primera_columna, ultima_columna)
    end

    vecinos_celula.sum { |vecino| vecino }
  end

  def imprimir_tablero
    @tablero.each do |fila|
      fila.each do |columna|
        if columna == 1
          print "#{CARACTER_CELULA_VIVA} "
        elsif columna.zero?
          print "#{CARACTER_CELULA_MUERTA} "
        end
      end
      puts ''
    end
  end
end
