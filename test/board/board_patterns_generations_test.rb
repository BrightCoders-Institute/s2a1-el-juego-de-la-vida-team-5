# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative './modules/horizontal_line_patterns_module'
require_relative './modules/ring_patterns_module'
require_relative './modules/horizontal_diamond_patterns_module'
require_relative './modules/vertical_diamond_patterns_module'
require_relative './modules/square_patterns_module'
require_relative './modules/glider_patterns_module'
require_relative './inheritance_classes/abstract_board_generation_test'

# Class to test Board class patterns generation.
class TestBoardPatternsGeneration < TestAbstractBoardGeneration
  include HorizontalLinePatternsModule
  include RingPatternsModule
  include HorizontalDiamondPatternsModule
  include VerticalDiamondPatternsModule
  include SquarePatternsModule
  include GliderPatternsModule

  private

  def map_board_to_integers(board)
    board.map { |row| row.map { |cell| cell.class::VALUE } }
  end

  def test_generation_patterns(board, patterns)
    patterns.each do |pattern|
      board.next_gen
      assert_equal map_board_to_integers(pattern), map_board_to_integers(board.board)
    end
  end

  def test_pattern(rows, columns, initial_board, board_patterns)
    board = Board.new(rows, columns, 0)
    board.instance_variable_set('@board', initial_board)
    test_generation_patterns(board, board_patterns)
  end

  public

  def test_stable_blinker_line_gen_pattern
    test_pattern(3, 3, HORIZONTAL_LINE_BOARD, HORIZONTAL_LINE_PATTERNS)
  end

  def test_stable_ring_pattern
    test_pattern(4, 4, RING_BOARD, RING_PATTERNS)
  end

  def test_stable_horizontal_diamond_pattern
    test_pattern(3, 4, HORIZONTAL_DIAMOND_BOARD, HORIZONTAL_DIAMOND_PATTERNS)
  end

  def test_stable_vertical_diamond_pattern
    test_pattern(4, 3, VERTICAL_DIAMOND_BOARD, VERTICAL_DIAMOND_PATTERNS)
  end

  def test_stable_square_gen_pattern
    test_pattern(3, 3, SQUARE_BOARD, SQUARE_PATTERNS)
  end

  def test_glider_gen_pattern
    test_pattern(4, 4, GLIDER_BOARD, GLIDER_PATTERNS)
  end
end
