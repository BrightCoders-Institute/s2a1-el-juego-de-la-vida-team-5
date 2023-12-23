# frozen_string_literal: true

require_relative '../../../src/classes/cell/alive_cell'
require_relative '../../../src/classes/cell/dead_cell'

# Module to save Life of Game horizontal diamond testing patterns.
module HorizontalDiamondPatternsModule
  HORIZONTAL_DIAMOND_BOARD = [[DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new],
                              [DeadCell.new, AliveCell.new, AliveCell.new, AliveCell.new],
                              [DeadCell.new, AliveCell.new, DeadCell.new, DeadCell.new]].freeze

  HORIZONTAL_DIAMOND_PATTERNS = [[[DeadCell.new, DeadCell.new, AliveCell.new, DeadCell.new],
                                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                                  [DeadCell.new, AliveCell.new, DeadCell.new, DeadCell.new]],
                                 [[DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new]],
                                 [[DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                                  [AliveCell.new, DeadCell.new, DeadCell.new, AliveCell.new],
                                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new]],
                                 [[DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                                  [AliveCell.new, DeadCell.new, DeadCell.new, AliveCell.new],
                                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new]]].freeze
end
