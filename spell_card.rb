class SpellCard

  def initialize(name, element)
    @name = name
    @element = element
  end

  def to_s
    "#{@name}[#{@element}]"
  end

  def attack(monster)
    if monster.status[:type] == "burnt"
      monster.status[:duration] += 1
      puts "casts #{@name} spell on enemy's #{monster.name}"
    end
  end
  
end