require_relative 'monster'
require_relative 'fire_monster'
require_relative 'ice_monster'
require_relative 'lightning_monster'
require_relative 'player'

phpkachu = LightningMonster.new('Phpkachu', 120, 50)
sqlrtle = IceMonster.new('Sqlrtle', 180, 20)
cppmander = FireMonster.new('Cppmander', 100, 80)
bashtoise = IceMonster.new('Bashtoise', 120, 60)
torterraform = Monster.new('Torterraform', 200, 10)

player1 = Player.new('Player 1')
player1.add_monster(sqlrtle)
player1.add_monster(cppmander)
player1.add_monster(torterraform)

player2 = Player.new('Player 2')
player2.add_monster(phpkachu)
player2.add_monster(cppmander)
player2.add_monster(bashtoise)

puts '=======================Turn 1======================='
puts ''

puts player1
puts ''

puts player2
puts ''

player1.play_turn(2, 1, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

player2.play_turn(2, 3, player1)
puts ''

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 2======================='
puts ''

player1.new_turn
player2.new_turn

puts player1
puts ''

puts player2
puts ''

player1.play_turn(1, 3, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

player2.play_turn(3, 1, player1)
puts ''

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 3======================='
puts ''

player1.new_turn
player2.new_turn

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 4======================='
puts ''

player1.new_turn
player2.new_turn

puts player1
puts ''

puts player2
puts ''