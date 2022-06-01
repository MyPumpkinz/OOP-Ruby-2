class Monster
  attr_reader :name, :attack_point, :duration_effect, :status, :attack_point_effect
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @duration_effect = 0
    @status = ''
    @attack_point_effect = 0
  end

  def to_s
    result = ''
    if @hitpoint > 0
      result += "#{@name}[#{@hitpoint}]"
    else
      result += "#{@name}[X]"
    end
    
    if @status != ''
      result += "[#{@status}]"
    end
    result
  end
  
  def attack(monster)
    monster.take_damage(@attack_point) #playerpertama
    take_damage(0.5 * monster.attack_point) #playerkedua

    puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
  end

  def take_damage(amount)
    @hitpoint = @hitpoint - amount
  end

  def set_duration_effect(duration)
    @duration_effect = duration
  end

  def set_status(status)
    @status = status
  end

  def set_attack_point_effect(attack_point_effect)
    @attack_point_effect = attack_point_effect
  end
    
    def cek_status
    if @status == "burnt"
      if @duration_effect != 3
        take_damage(@attack_point_effect)
      end
    end
    
    if @duration_effect == 0
      @status = ''
    end
      
    if @status == "frozen"
      if @duration_effect == 0
        @status = ''
      end
      end
  end

  def decrease_duration
    if @duration_effect != 0
      @duration_effect -= 1
    end
  end
end