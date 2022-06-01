require_relative "monster"

class FireMonster < Monster
  def attack(monster)
    monster.set_status("burnt")
    monster.set_duration_effect(3)
    monster.set_attack_point_effect(@attack_point * 0.4)
    monster.take_damage(@attack_point * 0)
    take_damage(0.5 * monster.attack_point)
  end 

end