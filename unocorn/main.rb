require 'pry'

def str_to_coord(str)
  output = []
  str.split(",").each do |i|
    output.push(i.to_i)
  end
  return output
end

class Cli
  attr_accessor :input, :output

  def initialize
    @input = $stdin
    @output = $stdout
  end
end


class Room
  attr_accessor :position, :welcome_msg, :name

  def initialize(params)
    @position = params.fetch(:position, "0,0,0")
    @welcome_msg = params.fetch(:welcome_msg, "default")
  end

  def interact(action, state)
# binding.pry
    if ["north", "south", "west", "east", "up", "down"].include?(action)
      move(state, action)
      return
    end

    case action
    when "research"
      if state.position == "2,4,2"
        puts "You researched the science!\n\nYou Win!!!!!"
        exit
      else
        puts "Invalid Action"
      end
    when "q"
      exit
    else
      puts "Invalid Action"
    end
  end

  def move(state, dir)
    pos = str_to_coord(state.position)
    # dir = [0,1,0] -- north
    # dir = [0,-1,0] -- south
    dir_vec = {
      "north" => [0,1,0],
      "south" => [0,-1,0],
      "west" => [-1,0,0],
      "east" => [1,0,0],
      "up" => [0,0,1],
      "down" => [0,0,-1]
    }
    move_vec = dir_vec[dir]
    new_pos = [pos[0] + move_vec[0], pos[1] + move_vec[1], pos[2] + move_vec[2]].to_s
      .gsub("[", "")
      .gsub("]", "")
      .gsub(" ", "")
    if (state.map.rooms[new_pos])
      state.position = new_pos
    else
      puts "You're blocked!"
    end
  end

end

class State
  attr_accessor :position, :items, :triggers, :map

  def initialize(map)
    @position = "2,2,2"
    @items = []
    @triggers = {}
    @map = map
  end
end

class Map
  attr_accessor :rooms

  def initialize
    @rooms = {}
  end
end


map = Map.new
room = Room.new({:position => "2,2,2",
  :welcome_msg => "\n=== Control Room ===\n\nYou're in the Control Room, where you started. You haven't gotten very far.\n"})
map.rooms["2,2,2"] = room
room = Room.new({:position => "2,3,2", :welcome_msg => "\n=== Hallway Tube ===\n\nYou're in a boring tube-shaped hallway."})
map.rooms["2,3,2"] = room
room = Room.new({:position => "2,4,2", :welcome_msg => "\n=== Science Room ===\n\nThere's science in here!"})
map.rooms["2,4,2"] = room
room = Room.new({:position => "2,2,1",
  :welcome_msg => "\n=== Control Room Hole ===\n\nYou fell into the hole in the Control Room. Good work.\n"})
map.rooms["2,2,1"] = room
state = State.new(map)
# binding.pry

inp = ""

cli = Cli.new


system("clear")

puts "You are on a science mission. You are in a science vessel."
sleep (2)
puts "You have on scientist glasses and you are a scientist."
sleep(2)
puts "You can go up, down, north, south, east, west"
sleep(3)
puts "but you know this already... because you know science."
sleep(4)
puts "That's why you're on a science mission."
sleep(4)
puts "On a science vessel, in science glasses."
sleep(4)
puts "Something tells you there is science to be researched."
sleep(4)
puts "You adjust your glasses, the sun's intense rays pierce the science windows."
sleep(4)
puts "You are ready to science."
sleep(2)

while true


puts map.rooms[state.position].welcome_msg
print "-> "

inp = gets.chomp
room.interact(inp, state)
end
