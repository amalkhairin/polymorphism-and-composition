require_relative "monster"

class IceMonster < Monster
  
  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point)
    @damage = attack_point * 0.8
    @special_attack = {
      type: "frozen",
      duration: 1
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
      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@damage.to_f} damage, takes #{0.5 * monster.attack_point.to_f} damage, inflict frozen status for 1 turns with 0 damage each turn"
    end
  end
end
  
    
    