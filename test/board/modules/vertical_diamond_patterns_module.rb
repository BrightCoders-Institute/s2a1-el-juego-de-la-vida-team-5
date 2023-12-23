# frozen_string_literal: true

require_relative '../../../src/classes/cell/alive_cell'
require_relative '../../../src/classes/cell/dead_cell'

# Module to save Life of Game vertical diamond testing patterns.
module VerticalDiamondPatternsModule
  VERTICAL_DIAMOND_BOARD = [[DeadCell.new, AliveCell.new, DeadCell.new],
                            [DeadCell.new, AliveCell.new, DeadCell.new],
                            [DeadCell.new, AliveCell.new, DeadCell.new],
                            [DeadCell.new, AliveCell.new, DeadCell.new]].freeze

  VERTICAL_DIAMOND_PATTERNS = [[[DeadCell.new, DeadCell.new, DeadCell.new],
                                [AliveCell.new, AliveCell.new, AliveCell.new],
                                [AliveCell.new, AliveCell.new, AliveCell.new],
                                [DeadCell.new, DeadCell.new, DeadCell.new]],
                               [[DeadCell.new, AliveCell.new, DeadCell.new],
                                [AliveCell.new, DeadCell.new, AliveCell.new],
                                [AliveCell.new, DeadCell.new, AliveCell.new],
                                [DeadCell.new, AliveCell.new, DeadCell.new]],
                               [[DeadCell.new, AliveCell.new, DeadCell.new],
                                [AliveCell.new, DeadCell.new, AliveCell.new],
                                [AliveCell.new, DeadCell.new, AliveCell.new],
                                [DeadCell.new, AliveCell.new, DeadCell.new]]].freeze
end
