class Cli
  attr_accessor :input, :output
  def initialize
    @input = $stdin
    @output = $stdout
  end
end

inventory = []

class Room
  attr_accessor :name, :objects, :prompt
  def initialize(name, objects, prompt, layout)
    @name = name
    @objects = objects #array
    @prompt = prompt
    @layout = layout
  end
  def look
    things = ""
    @objects.each do |object|
      things += object.name + "  "
    end
    puts "#{@layout}"
    puts "Around you find: #{things}"
  end
end

class SpaceObject
  attr_accessor :name, :commands
  def initialize(name, commands)
    @name = name #object name
    @commands = commands #hash key(command) => value(output)


  end
end


system("clear")

$rooms = [Room.new('bathroom',
          [ SpaceObject.new("plunger", { look: "This is a space plunger. It'll grab on to *anything*." }),
            SpaceObject.new("door", { look: "It's like, space-stuck.", use: "Narp. There's no handle, this is a space door. If only you could get some suction on it."}) ],
          "You are a janitor on the Death Star, and stuck in a bathroom.",
          "You're in a dirty bathroom deep in the bowels of the death star. The door looks very stuck. It's a smelly bathroom"),
          Room.new("outside",
          [],
          "You're in a maintenance shaft now. That sucks. At least it's not a smelly bathroom.",
          "Nothing more to see here. Our reality has ended. Leave me. You win.")
        ]


input = ""

def parse(input, object, other_Object, room)
  room.objects.each do |obj|
    if object == obj.name
      object = obj
    end
  end


  if input == "look" && object == nil
    room.look
  elsif input == "look"
    puts object.commands[:look]
  end

  if input == "use"
    if object.name == "plunger"
      if other_Object == "door"
        puts "Oh hey, that worked. You stick the plunger on the door and pull laterally. The door squeaks open. The emperor is pleased with your janitorial efforts. Maybe they'll move you to canteen."
         $currentroom = $rooms[1]
      end
    end
  end

end

$currentroom = $rooms[0]


while input != 'exit'
  # system("clear")
  puts
  puts $currentroom.prompt
  input = gets.chomp
  commands = input.split(" ")

  parse(commands[0], commands[1], commands[3], $currentroom)
end
