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
    result = "#{@name}:\n" #player:
    
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
    opponent_monster = opponent.monsters[opponent_card-1]

    if @monsters[own_card-1].status == "frozen"
       puts "#{@name}'s #{@monsters[own_card-1].name} is in frozen state, can't attack"
      return
    end

  @monsters[own_card-1].attack(opponent.monsters[opponent_card-1])

    if opponent_monster.status == 'burnt' and opponent_monster.duration_effect == 3
      puts "#{@name}'s #{@monsters[own_card-1].name} uses elemental attack on enemy's #{opponent_monster.name}, deals 0 damage, takes #{0.5 * opponent_monster.attack_point} damage, inflict burnt status for 3 turns with #{0.4 * @monsters[own_card-1].attack_point} damage each turn"
    end

    if opponent_monster.status == "frozen" and opponent_monster.duration_effect == 1
      puts "#{@name}'s #{@monsters[own_card-1].name} uses elemental attack on enemy's #{opponent_monster.name}, deals #{0.8 * @monsters[own_card-1].attack_point} damage, takes #{0.5 * opponent_monster.attack_point} damage, inflict frozen status for 1 turns with 0 damage each turn"
    end
  end

  def decrease_duration_each_monster
    @monsters.each do |monster|
      monster.decrease_duration
      monster.cek_status
    end
  end
  
end

