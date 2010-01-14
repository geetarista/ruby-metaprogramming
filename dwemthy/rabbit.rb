class Rabbit < Creature
  traits :bombs

  life 10
  strength 2
  charisma 44
  weapon 4
  bombs 3

  # little boomerang
  def ^( enemy )
    fight( enemy, 13 )
  end
  # the hero's sword is unlimited!!
  def /( enemy )
    fight( enemy, rand( 4 + ( ( enemy.life % 10 ) ** 2 ) ) )
  end
  # lettuce will build your strength and extra ruffage
  # will fly in the face of your opponent!!
  def %( enemy )
    lettuce = rand( charisma )
    puts "[Healthy lettuce gives you #{ lettuce } life points!!]"
    @life += lettuce
    fight( enemy, 0 )
  end
  # bombs, but you only have three!!
  def *( enemy )
    if @bombs.zero?
      puts "[UHN!! You're out of bombs!!]"
      return
    end
    @bombs -= 1
    fight( enemy, 86 )
  end
end
