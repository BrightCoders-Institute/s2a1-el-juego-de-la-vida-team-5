# frozen_string_literal: true

require_relative './board'

# Class to initialize the game.
class GameEngine
  def initialize; end

  private

  # Method to clean the console.
  def clean_console
    if Gem.win_platform?
      system('cls')
    else
      system('clear')
    end
  end

  # Method where the dimensions of the array are declared by the user.
  def get_parameter(nombre)
    parameter = 0

    loop do
      print "Cantidad de #{nombre} (debe estar entre 5 y 20): "
      parameter = gets.chomp.to_i

      raise ArgumentError unless parameter.between?(5, 20)

      break
    rescue ArgumentError
      puts 'El valor especificado no es un entero positivo entre 5 y 20.'
    end

    parameter
  end

  # Method where the game runs.
  def run_game
    loop do
      @board.print_board
      sleep 0.8
      clean_console
      @board.next_gen
    end
  end

  public

  # Game initialization method.
  def initialize_game
    puts '¡Hola! Bienvenido al Juego de la Vida de Conway.'
    puts 'Especifique el tamaño de su tablero.'
    puts ''

    rows = get_parameter('filas')
    columns = get_parameter('columnas')
    initial_cells_count = rand(5...rows * columns)
    @board = Board.new(columns, rows, initial_cells_count)
    clean_console

    run_game
  end
end
