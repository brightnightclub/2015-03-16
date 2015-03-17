require 'item'

class Map
  SCENES = [
    "You're just outside of a forest. You can hear a bubbling brook in the distance.",
    "You're at the edge of a cliff, peering into the dark abyss.",
    "You're at the top of a waterfall. Make a wish.",
    "You are deep in a thick jungle. You feel a dark gaze upon you.",
    "You stand before an ancient temple stretching deep into the ocean.",
    "You stand before an army of goblins, poised to attack.",
    "You're standing in a sea of roses. You smell blood in the air."
  ]
  attr_accessor :player_position, :world, :items, :debug
  
  def initialize
    @debug = false
    @player_position = '0|0'
    @world = { '0|0' => "You are in a dense wood." }
    @items = { '0|0' => [Item.new(name: 'stick', strength: 1)] }
  end
  
  def describe
    world_description = self.world[self.player_position]
    items_here = self.items[self.player_position]
    item_descriptions = items_here.map(&:name) if items_here
    
    description = "#{world_description}\n"
    
    if items_here
      description << "You look about and see: #{item_descriptions.join(', ')}.\n"
    end
  
    if self.debug
      description << "player_position: #{self.player_position}\n"
      description << "items: #{self.items.inspect}\n"
      description << "world: #{self.world.inspect}\n"
    end
  
    description
  end
  
  def move(direction)
    xy = self.player_position.split('|').map(&:to_i)
    x, y = xy
    
    case direction.downcase
    when "north"
      y += 1
    when "south"
      y -= 1
    when "east"
      x += 1
    when "west"
      x -= 1
    end
    
    position = "#{x}|#{y}"
    
    generate(position)
    self.player_position = position
    
    describe
  end
  
  def generate(position)
    return if self.world[position]
    self.world[position] = SCENES.sample
    existing_items = self.items[position]
    
    if rand(1..2).even?
      if existing_items
        self.items[position] << Item.random
      else
        self.items[position] = [Item.random]
      end
    end
   end
end