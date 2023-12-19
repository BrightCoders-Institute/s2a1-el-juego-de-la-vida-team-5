class  Celula
  def initialize(state, fila, columna)
    @state = state
    @fila = 4
    @columna = 8


  end
  def contadorVivas

  end
end

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

  def calcular_siguiente_generacion
    @tablero.each_with_index.map do |fila, i|
      fila.each_with_index.map do |celula, j|
        numero_vecinos = contar_vecinos(i, j)
        print numero_vecinos

        if celula == 1
          # print numero_vecinos.between?(2, 3) ? 1 : 0
          # numero_vecinos.between?(2, 3) ? 1 : 0
        elsif celula == 0
          # print numero_vecinos == 3 ? 1 : 0
          # numero_vecinos == 3 ? 1 : 0
        end
      end
      puts ''
    end
  end

  def contar_vecinos(fila, columna)
    contar_vecinos_fila(obtener_fila(fila - 1), columna)
    + contar_vecinos_fila(obtener_fila(fila).map.with_index { |celula, i| i == columna ? 0 : celula }, columna)
    + contar_vecinos_fila(obtener_fila(fila + 1), columna)
  end

  def obtener_fila(fila)
    fila.between?(0, @columnas - 1) ? @tablero[fila] : []
  end

  def contar_vecinos_fila(vecinos, columna)
    return 0 if vecinos.empty?

    primera_columna = columna - 1 < 0 ? 0 : columna - 1
    ultima_columna = columna + 1 >= @columnas ? @columnas - 1 : columna + 1

    vecinos.select.with_index do |_vecino, i|
      i.between?(primera_columna, ultima_columna)
    end
    .sum { |vecino| vecino }
  end

  def imprimir_tablero
    @tablero.each do |fila|
      fila.each do |columna|
        if columna == 1
          print "#{CARACTER_CELULA_VIVA} "
        elsif columna == 0
          print "#{CARACTER_CELULA_MUERTA} "
        end
      end
      puts ''
    end
  end
end

tablero = Tablero.new(4, 8)
tablero.imprimir_tablero
puts ''
tablero.calcular_siguiente_generacion
tablero.imprimir_tablero
