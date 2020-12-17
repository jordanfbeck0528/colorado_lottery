require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'
class ContestantTest < Minitest::Test

  def setup
    @alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                        age: 28,
                         state_of_residence: 'CO',
                             spending_money: 10})

  end

  def test_it_exists_and_has_attributes
    assert_instance_of Contestant, @alexander
    assert_equal "Alexander Aigiades", @alexander.full_name
    assert_equal 28, @alexander.age
    assert_equal "CO", @alexander.state_of_residence
    assert_equal 10, @alexander.spending_money
    assert_equal false, @alexander.out_of_state?
  end

  def test_it_can_have_interests
    assert_equal [], @alexander.game_interests

    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    assert_equal ["Mega Millions", "Pick 4"], @alexander.game_interests
  end
end
