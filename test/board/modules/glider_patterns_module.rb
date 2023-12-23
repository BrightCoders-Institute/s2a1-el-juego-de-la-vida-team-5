# frozen_string_literal: true

require_relative '../../../src/classes/cell/alive_cell'
require_relative '../../../src/classes/cell/dead_cell'

# Module to save Life of Game glider testing patterns.
module GliderPatternsModule
  GLIDER_BOARD = [[DeadCell.new, DeadCell.new, AliveCell.new, DeadCell.new],
                  [AliveCell.new, DeadCell.new, AliveCell.new, DeadCell.new],
                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                  [DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new]].freeze

  GLIDER_PATTERNS = [[[DeadCell.new, AliveCell.new, DeadCell.new, DeadCell.new],
                      [DeadCell.new, DeadCell.new, AliveCell.new, AliveCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                      [DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new]],
                     [[DeadCell.new, DeadCell.new, AliveCell.new, DeadCell.new],
                      [DeadCell.new, DeadCell.new, DeadCell.new, AliveCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new, AliveCell.new],
                      [DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new]],
                     [[DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new],
                      [DeadCell.new, AliveCell.new, DeadCell.new, AliveCell.new],
                      [DeadCell.new, DeadCell.new, AliveCell.new, AliveCell.new],
                      [DeadCell.new, DeadCell.new, AliveCell.new, DeadCell.new]],
                     [[DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new],
                      [DeadCell.new, DeadCell.new, DeadCell.new, AliveCell.new],
                      [DeadCell.new, AliveCell.new, DeadCell.new, AliveCell.new],
                      [DeadCell.new, DeadCell.new, AliveCell.new, AliveCell.new]]].freeze
end
