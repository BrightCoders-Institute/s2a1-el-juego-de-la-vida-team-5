# frozen_string_literal: true

require_relative '../../../src/classes/cell/alive_cell'
require_relative '../../../src/classes/cell/dead_cell'

# Module to save Life of Game horizontal line testing patterns.
module HorizontalLinePatternsModule
  HORIZONTAL_LINE_BOARD = [[DeadCell.new, DeadCell.new, DeadCell.new],
                           [AliveCell.new, AliveCell.new, AliveCell.new],
                           [DeadCell.new, DeadCell.new, DeadCell.new]].freeze

  HORIZONTAL_LINE_PATTERNS = [[[DeadCell.new, AliveCell.new, DeadCell.new],
                               [DeadCell.new, AliveCell.new, DeadCell.new],
                               [DeadCell.new, AliveCell.new, DeadCell.new]],
                              [[DeadCell.new, DeadCell.new, DeadCell.new],
                               [AliveCell.new, AliveCell.new, AliveCell.new],
                               [DeadCell.new, DeadCell.new, DeadCell.new]],
                              [[DeadCell.new, AliveCell.new, DeadCell.new],
                               [DeadCell.new, AliveCell.new, DeadCell.new],
                               [DeadCell.new, AliveCell.new, DeadCell.new]],
                              [[DeadCell.new, DeadCell.new, DeadCell.new],
                               [AliveCell.new, AliveCell.new, AliveCell.new],
                               [DeadCell.new, DeadCell.new, DeadCell.new]]].freeze
end
