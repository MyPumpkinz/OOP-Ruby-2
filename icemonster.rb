require_relative "monster"

class IceMonster < Monster
  def attack(monster)
    monster.set_status("frozen")
    monster.set_duration_effect(1)
    monster.take_damage(0.8 * @attack_point)
    take_damage(0.5 * monster.attack_point)
  end 
end