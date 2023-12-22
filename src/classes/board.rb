# frozen_string_literal: true

require_relative './cell/alive_cell'
require_relative './cell/dead_cell'

# Class to control a board n*m.
# cells for the game of life.
class Board
  attr_reader :board

  # Method to initialize objects.
  def initialize(rows, columns, initial_cells_amount)
    @rows = rows
    @columns = columns
    @initial_cells_amount = initial_cells_amount

    @board = Array.new(rows) { Array.new(columns) { DeadCell.new } }
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

        next if @board[row][column].is_a?(AliveCell)

        @board[row][column] = AliveCell.new
        break
      end
    end
  end

  # Method to obtain the state of the cells.
  def set_cell_status(cell, number_neighbors)
    cell.check_cell_status_update(number_neighbors)
  end

  # Method to count neighbors.
  def count_neighbors(row, column)
    count_neighbors_row(obtain_row(row - 1), column) +
      count_neighbors_row(@board[row].map.with_index { |cell, i| i == column ? DeadCell.new : cell }, column) +
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

    neighbors_cell.sum { |neighbor| neighbor.class::VALUE }
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
      row.each do |cell|
        print "#{cell.class::CELL_CHARACTER} "
      end
      puts ''
    end
  end
end
