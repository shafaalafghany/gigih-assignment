class Spell
  attr_reader :name, :element

  def initialize(name, element)
    @name = name
    @element = element
  end

  def to_s
    "#{@name}[#{@element}]"
  end

  def new_turn
  end

  def Spell.check_status?(monster)
    if monster.debuff == "burnt"
      return true
    end
    
    return false
  end
  
  def attack(monster)
    if Spell.check_status?(monster)
      monster.add_counter
      puts "casts #{@name} spell on enemy's #{monster.name}" 
    end
  end
end