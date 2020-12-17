class Contestant
  attr_reader :first_name, :last_name, :age, :state_of_residence, :spending_money, :game_interests
  def initialize(contestant_data)
    @first_name = contestant_data[:first_name]
    @last_name = contestant_data[:last_name]
    @age = contestant_data[:age]
    @state_of_residence = contestant_data[:state_of_residence]
    @spending_money = contestant_data[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def full_name
    @first_name + ' ' + @last_name
  end

  def add_game_interest(name)
    @game_interests << name
  end

  def charge(game)
    @spending_money -= game.cost
  end
end
