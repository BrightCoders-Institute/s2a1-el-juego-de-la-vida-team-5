# frozen_string_literal: true

# Class to control a board n*m.
# cells for the game of life.
class Board
  # Living cell character.
  ALIVE_CELL_CHAR = '+'

  # Dead cell character.
  DEAD_CELL_CHAR = '.'

  attr_reader :board

  # Method to initialize objects.
  def initialize(rows, columns, initial_cells_amount)
    @rows = rows
    @columns = columns
    @initial_cells_amount = initial_cells_amount

    @board = Array.new(rows) { Array.new(columns) { 0 } }
    obtain_initial_cells

    # @rows = 3
    # @columns = 4
    # @board = [[0, 0, 0, 0], [0, 1, 1, 1], [1, 0, 0, 0]]
  end

  private

  # Method to obtain initial cells.
  def obtain_initial_cells
    @initial_cells_amount.times do
      loop do
        row = rand(0..@rows - 1)
        column = rand(0..@columns - 1)

        next if @board[row][column] == 1

        @board[row][column] = 1
        break
      end
    end
  end

  # Method to obtain the state of the cells.
  def set_cell_status(cell, number_neighbors)
    if cell == 1
      number_neighbors.between?(2, 3) ? 1 : 0
    elsif cell.zero?
      number_neighbors == 3 ? 1 : 0
    end
  end

  # Method to count neighbors.
  def count_neighbors(row, column)
    count_neighbors_row(obtain_row(row - 1), column) +
      count_neighbors_row(@board[row].map.with_index { |cell, i| i == column ? 0 : cell }, column) +
      count_neighbors_row(obtain_row(row + 1), column)
  end

  # Method to get a row.
  def obtain_row(row)
    row.between?(0, @rows - 1) ? @board[row] : []
  end

  # Method to count neighbors per row.
  def count_neighbors_row(neighbors, column)
    return 0 if neighbors.empty?

    first_column = (column - 1).negative? ? 0 : column - 1
    last_column = column + 1 >= @columns ? @columns - 1 : column + 1

    neighbors_cell = neighbors.select.with_index do |_neighbor, i|
      i.between?(first_column, last_column)
    end

    neighbors_cell.sum { |neighbor| neighbor }
  end

  public

  # Method to create next generation of board.
  def next_gen
    @board = @board.each_with_index.map do |row, i|
      row.each_with_index.map do |cell, j|
        set_cell_status(cell, count_neighbors(i, j))
      end
    end
  end

  # Method to generate the board.
  def print_board
    @board.each do |row|
      row.each do |column|
        if column == 1
          print "#{ALIVE_CELL_CHAR} "
        elsif column.zero?
          print "#{DEAD_CELL_CHAR} "
        end
      end
      puts ''
    end
  end
end
