require 'pry'
require './mudrakers_data.rb'

class Room
  
  attr_accessor :doors, :number_of_doors, :artifact, :npc
  
  def initialize(prev_room = nil, artifact, npc)
    @number_of_doors = rand(3) + 2
    @doors = []
    @doors << prev_room if prev_room
    @artifact = artifact
    @npc = npc
  end
  
  def enter_room
    check_for_doors
    puts "You've entered a mysterious room. Inside, you find a #{ @artifact.name } and a #{ @npc.adjective } #{ @npc.name }"
    puts "You see #{ @doors.count } doors. Enter a door number."
    input = gets.chomp
    @doors[input.to_i - 1].enter_room
  end
  
  def check_for_doors
    if @doors.count < @number_of_doors
      build_rooms
    end
  end
    
  def build_rooms
    (@number_of_doors - 1).times do
      @doors << Room.new(self, Artifact.new, Npc.new)
    end
  end
  
  private
    
end

class Npc
  attr_accessor :type, :adjective, :name
  
  def initialize
    @name = ::NPC_NAMES[rand(::NPC_NAMES.length)]
    @adjective = ::ADJECTIVES[rand(::ADJECTIVES.length)]
  end
end

class Artifact
  
  attr_accessor :name 
  
  def initialize
    @name = ::ARTIFACT_NAMES[rand(::ARTIFACT_NAMES.length)]
  end
    
end


class World
  
  attr_accessor :first_room
  
  def initialize()
    @first_room = Room.new(nil, Artifact.new, Npc.new)
  end
  
  
  
end


new_world = World.new()
new_world.first_room.enter_room



