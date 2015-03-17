require './world.rb'
@world = UnderWorld.new
puts @world.garden_of_fingers.base_description

def get_input
  @input = gets.chomp().downcase

  case @input

  when "look"
    puts @world.garden_of_fingers.extended
  when "north"
    puts @world.zone_of_things.base_description
  when "set it on fire"
    puts "You lose"
    `open https://www.youtube.com/watch?v=PkVbF9DmtSw`
    exit
  end

  get_input
end


get_input
