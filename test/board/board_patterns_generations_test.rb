# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative './abstract_board_generation_test'

# Class to test Board class patterns generation.
class TestBoardPatternsGeneration < TestAbstractBoardGeneration
  private

  def test_generation_patterns(board, *patterns)
    patterns.each do |pattern|
      board.next_gen
      assert_equal pattern, board.board
    end
  end

  public

  def test_stable_blinker_line_gen_pattern
    blinker_line = Board.new(3, 3, 0)
    blinker_line.instance_variable_set('@board', [[0, 0, 0], [1, 1, 1], [0, 0, 0]])
    test_generation_patterns(blinker_line,
                             [[0, 1, 0], [0, 1, 0], [0, 1, 0]],
                             [[0, 0, 0], [1, 1, 1], [0, 0, 0]],
                             [[0, 1, 0], [0, 1, 0], [0, 1, 0]],
                             [[0, 0, 0], [1, 1, 1], [0, 0, 0]])
  end

  def test_stable_ring_pattern
    ring_board = Board.new(4, 4, 0)
    ring_board.instance_variable_set('@board', [[0, 0, 0, 0], [0, 0, 1, 0], [1, 1, 0, 0], [0, 1, 0, 0]])
    test_generation_patterns(ring_board,
                             [[0, 0, 0, 0], [0, 1, 0, 0], [1, 1, 1, 0], [1, 1, 0, 0]],
                             [[0, 0, 0, 0], [1, 1, 1, 0], [0, 0, 1, 0], [1, 0, 1, 0]],
                             [[0, 1, 0, 0], [0, 1, 1, 0], [1, 0, 1, 1], [0, 1, 0, 0]],
                             [[0, 1, 1, 0], [1, 0, 0, 1], [1, 0, 0, 1], [0, 1, 1, 0]])
  end

  def test_stable_horizontal_diamond_pattern
    horizontal_diamond_board = Board.new(3, 4, 0)
    horizontal_diamond_board.instance_variable_set('@board', [[0, 0, 0, 0], [0, 1, 1, 1], [0, 1, 0, 0]])
    test_generation_patterns(horizontal_diamond_board,
                             [[0, 0, 1, 0], [0, 1, 1, 0], [0, 1, 0, 0]],
                             [[0, 1, 1, 0], [0, 1, 1, 0], [0, 1, 1, 0]],
                             [[0, 1, 1, 0], [1, 0, 0, 1], [0, 1, 1, 0]],
                             [[0, 1, 1, 0], [1, 0, 0, 1], [0, 1, 1, 0]])
  end

  def test_stable_vertical_diamond_pattern
    vertical_diamond_board = Board.new(4, 3, 0)
    vertical_diamond_board.instance_variable_set('@board', [[0, 1, 0], [0, 1, 0], [0, 1, 0], [0, 1, 0]])
    test_generation_patterns(vertical_diamond_board,
                             [[0, 0, 0], [1, 1, 1], [1, 1, 1], [0, 0, 0]],
                             [[0, 1, 0], [1, 0, 1], [1, 0, 1], [0, 1, 0]],
                             [[0, 1, 0], [1, 0, 1], [1, 0, 1], [0, 1, 0]])
  end

  def test_stable_square_gen_pattern
    square_board = Board.new(3, 3, 0)
    square_board.instance_variable_set('@board', [[0, 0, 0], [0, 1, 1], [0, 1, 1]])
    test_generation_patterns(square_board,
                             [[0, 0, 0], [0, 1, 1], [0, 1, 1]],
                             [[0, 0, 0], [0, 1, 1], [0, 1, 1]],
                             [[0, 0, 0], [0, 1, 1], [0, 1, 1]])
  end

  def test_glider_gen_pattern
    glider_board = Board.new(4, 4, 0)
    glider_board.instance_variable_set('@board', [[0, 0, 1, 0], [1, 0, 1, 0], [0, 1, 1, 0], [0, 0, 0, 0]])
    test_generation_patterns(glider_board,
                             [[0, 1, 0, 0], [0, 0, 1, 1], [0, 1, 1, 0], [0, 0, 0, 0]],
                             [[0, 0, 1, 0], [0, 0, 0, 1], [0, 1, 1, 1], [0, 0, 0, 0]],
                             [[0, 0, 0, 0], [0, 1, 0, 1], [0, 0, 1, 1], [0, 0, 1, 0]],
                             [[0, 0, 0, 0], [0, 0, 0, 1], [0, 1, 0, 1], [0, 0, 1, 1]])
  end
end
