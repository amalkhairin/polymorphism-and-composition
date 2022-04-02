class Monster
  attr_reader :name, :attack_point
  attr_accessor :status

  @status

  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
  end

  def to_s
    if @hitpoint > 0
      if @status != nil
        "#{@name}[#{@hitpoint}][#{@status[:type]}]"
      else
        "#{@name}[#{@hitpoint}]"
      end
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    if @status != nil
      if @status[:type] == "frozen"
        puts "#{@name} is in frozen state, can't attack"
      end
    else
      monster.take_damage(@attack_point)
      puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
    end
    take_damage(0.5 * monster.attack_point)
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def apply_effect(effect)
    @status = effect
  end

  def update_effect
    if @status != nil
      if @status[:type] == "frozen"
        @status[:duration] -= 1
        if @status[:duration] == 0
          @status = nil
        end
      else
        take_damage(@status[:amount])
        if @status[:duration] > 0
          @status[:duration] -= 1
        else
          @status = nil
        end
      end
    end
  end
  
end