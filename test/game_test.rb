require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'
class GameTest < Minitest::Test
  def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Game, @mega_millions
    assert_equal "Mega Millions", @mega_millions.name
    assert_equal 5, @mega_millions.cost
    assert_equal true, @mega_millions.national_drawing?
    assert_equal false, @pick_4.national_drawing?
  end
end
