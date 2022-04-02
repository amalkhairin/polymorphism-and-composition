class Player
  attr_reader :monsters

  def initialize(name)
    @name = name
    @monsters = []
  end

  def add_monster(monster)
    monsters << monster.dup
  end

  def to_s
    result = "#{@name}:\n"
    
    @monsters.each_with_index do |monster, index|
      result += monster.to_s
      if index < @monsters.size - 1
        result += ', '
      else
        result += "\n"
      end
    end
    
    result
  end

  def play_turn(own_card, opponent_card, opponent)
    print "#{@name}'s "
    @monsters[own_card-1].attack(opponent.monsters[opponent_card-1])
  end

  def apply_effects
    @monsters.each do |monster|
      if monster.respond_to?('update_effect')
        if monster.status != nil
          monster.update_effect
        end
      end
    end
  end
  
end