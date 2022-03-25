class FireMonster < Monster
  def attack(monster)
    if @debuff == "frozen"
      puts "#{@name} is in frozen state, can't attack"
      return
    elsif @debuff == "stunned"
      puts "#{@name} is in stunned state, can't attack"
    end
    
    monster.take_effect("burnt", 0.4 * @attack_point.to_f)
    take_damage(0.5 * monster.attack_point)

    puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals 0 damage, takes #{0.5 * monster.attack_point} damage, inflict burnt status for 3 turns with #{0.4 * @attack_point.to_f} damage each turn"
  end
end