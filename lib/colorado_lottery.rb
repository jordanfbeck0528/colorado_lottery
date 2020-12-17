class ColoradoLottery
  attr_reader :registered_contestants, :winners, :current_contestants
  def initialize
    @registered_contestants = Hash.new { |hash, key| hash[key] = []}
    @winners = []
    @current_contestants = Hash.new { |hash, key| hash[key] = []}
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def can_register?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18 &&
    (contestant.state_of_residence == 'CO' || game.national_drawing? == true )
  end

  def register_contestant(contestant, game)
    @registered_contestants[game.name] << contestant
  end

  def eligible_contestants(game)
    contestants = []
    registered_contestants[game.name].each do |contestant|
      contestants << contestant if can_register?(contestant, game) && (contestant.spending_money > game.cost)
    end
    # require "pry"; binding.pry
    # contestants
  end

  def charge_contestants(game)
    eligible_contestants(game).each do |contestant|
      contestant.charge(game)
    end
    add_current(game)
  end

  def add_current(game)
    eligible_contestants(game).select do |contestant|
      @current_contestants[game] << contestant.full_name
    end
  end
end
