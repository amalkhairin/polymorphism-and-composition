require_relative "monster"

class FireMonster < Monster
  
  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point)
    @damage = 0
    @special_attack = {
      type: "burnt",
      amount: attack_point * 0.4,
      duration: 4
    }
  end

  def attack(monster)
    if @status != nil
      if @status[:type] == "frozen"
        puts "#{@name} is in frozen state, can't attack"
      end
    else
      monster.take_damage(@damage)
      monster.apply_effect(@special_attack)
      take_damage(0.5 * monster.attack_point)
      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@damage} damage, takes #{0.5 * monster.attack_point.to_f} damage, inflict burnt status for 3 turns with #{@attack_point.to_f * 0.4} damage each turn"
    end
  end
end
  
    
    