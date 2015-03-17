require './zone.rb'
require './cli.rb'

class UnderWorld
  attr_accessor(:zone_of_things, :garden_of_fingers, :cli)


  def initialize
    build_zones
    @cli = Cli.new
    # bring_to_life
  end

  def build_zones
    @zone_of_things = Zone.new
    @zone_of_things.base_description = "There are things in this zone."
    @garden_of_fingers = Zone.new
    @garden_of_fingers.base_description= "You have entered an eery place, mist veils much of your vision.  With each step you feel a strange rubbery feeling up against your feet.  As you look closer you see this zone is filled with strange plants of fingers. Disturbing. "
    @garden_of_fingers.extended = "Its a garden of fingers guys."
  end

  def read_description(zone)
    @cli.output = zone.base_description
  end

  # def bring_to_life
  #   @tokun
  # end
end

world = UnderWorld.new
