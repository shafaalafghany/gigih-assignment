class Monster
  attr_reader :name, :attack_point, :debuff
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @debuff = ""
    @counter = 0
    @save_damage = 0
  end

  def to_s
    if @hitpoint > 0 && @counter != 0
      "#{@name}[#{@hitpoint}][#{@debuff}]"
    elsif @hitpoint > 0 
      "#{@name}[#{@hitpoint}]"
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    monster.take_damage(@attack_point)
    take_damage(0.5 * monster.attack_point)

    puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def take_effect(effect, save_damage)
    @debuff = effect
    if effect == "burnt"
      @counter += 3
      @save_damage = save_damage
    elsif effect == "frozen"
      @counter += 1
    end
  end

  def new_turn
    if @debuff != "" && @counter > 0
      @counter -= 1
      if @debuff == "burnt"
        @hitpoint -= @save_damage
      end
    elsif @counter == 0
      @debuff = ""
      @save_damage = 0
    end
  end

  def add_counter
    @counter += 1
  end
end