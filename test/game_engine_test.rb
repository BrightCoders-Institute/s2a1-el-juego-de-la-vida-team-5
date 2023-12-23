# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/classes/game_engine'

class TestGameEngine < Minitest::Test
  def setup
    @game_engine = GameEngine.new
  end

  def test_clean_console
    # Assuming clear_console is void and just execute system command.
    assert_silent { @game_engine.send(:clean_console) }
  end

  def test_get_parameter_valid_input
    input = StringIO.new('10\n')
    $stdin = input
    assert_output(/Cantidad de filas/) { assert_equal 10, @game_engine.send(:get_parameter, 'filas') }
  ensure
    $stdin = STDIN
  end

  def test_get_parameter_invalid_input_then_valid_input
    input = StringIO.new('invalid\n10\n')
    $stdin = input
    assert_output(/Cantidad de filas/) { assert_equal 10, @game_engine.send(:get_parameter, 'filas') }
  ensure
    $stdin = STDIN
  end
end
