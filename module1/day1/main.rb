require_relative 'monster'
require_relative 'player'

phpkachu = Monster.new('Phpkachu', 80, 50)
sqlrtle = Monster.new('Sqlrtle', 100, 20)
cppmander = Monster.new('Cppmander', 40, 80)
bashtoise = Monster.new('Bashtoise', 60, 60)
torterraform = Monster.new('Torterraform', 120, 10)
monsters = [phpkachu, sqlrtle, cppmander, bashtoise, torterraform]

player1_monsters = [phpkachu, cppmander.clone, torterraform]
player2_monsters = [sqlrtle, cppmander, bashtoise]

player1 = Player.new(player1_monsters)
player2 = Player.new(player2_monsters)

puts "Player 1:"
puts player1.print_players_monster(player1_monsters)
puts "Player 2:"
puts player2.print_players_monster(player2_monsters)
puts "=======================Turn 1======================="
puts ""
puts player1.monsters[0].attack("Player 1", player2.monsters[1])
puts "Player 1:"
puts player1.print_players_monster(player1_monsters)
puts "Player 2:"
puts player2.print_players_monster(player2_monsters)
puts player2.monsters[0].attack("Player 2", player1.monsters[1])
puts "Player 1:"
puts player1.print_players_monster(player1_monsters)
puts "Player 2:"
puts player2.print_players_monster(player2_monsters)