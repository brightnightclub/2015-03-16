require 'map'

class Dispatch
  attr_accessor :map
  
  def initialize
    @map = Map.new
  end
  
  def execute command
    verb, noun = command.split.map(&:downcase)  
    
    case verb
    when "move"
      self.map.move noun
    when "attack"
      monster.fight()
    when "pickup"
      item = Item.new(:name => noun)
      inventory.add(item)
    when "drop"
      inventory.drop(noun)
    when "dance!"
      puts "You win so hard!"
    when "burn"
      puts "DOOM! DESECRATION! THE RIVERS RUN RED WITH YOUR BLOOD!"
      puts "The angels will weep for a thousand years for your treacherous betrayal of people and country."
      puts "Thank you for playing."
      puts "<3 BenBen!"
    else
      "That's not a command!"
    end
  end

end