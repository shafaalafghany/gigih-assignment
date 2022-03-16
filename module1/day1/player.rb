class Player
  attr_accessor :monsters

  def initialize(monsters)
    @monsters = monsters
  end

  def print_players_monster(monsters)
    puts monsters.join(", ")
  end
end