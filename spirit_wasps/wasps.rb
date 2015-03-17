require_relative 'lib/room'

entry = Room.new <<-ENTRY
You've entered the spookiest of houses.
There is a creaky STAIRCASE in front of you, to the NORTH, with an open DOOR next to it. There is a slightly open DOOR to WEST and a potentially locked DOOR to the EAST. This is **the creepiest place you have ever been.
ENTRY

dining_room = Room.new <<-DINING_ROOM
You've entered the Dining Room.
DINING_ROOM

study = Room.new <<-STUDY
You've entered the Study.
STUDY

kitchen = Room.new <<-KITCHEN
You've entered the Kitchen.
KITCHEN

living_room = Room.new <<-LIVING_ROOM
You've entered the Living Room.
LIVING_ROOM

library = Room.new <<-LIBRARY
You've entered the Library.
LIBRARY

half_bath = Room.new <<-HALF_BATH
You've entered the Half Bath.
HALF_BATH

pantry = Room.new <<-PANTRY
You've entered the Pantry.
PANTRY

sitting_room = Room.new <<-SITTING_ROOM
You've entered the Sitting Room.
SITTING_ROOM

guest_room = Room.new <<-GUEST_ROOM
You've entered the Guest Room.
GUEST_ROOM

landing = Room.new <<-LANDING
You've entered the Landing.
LANDING

master_bedroom = Room.new <<-MASTER_BEDROOM
You've entered the Master Bedroom.
MASTER_BEDROOM

full_bath = Room.new <<-FULL_BATH
You've entered the Full Bath.
FULL_BATH

closet = Room.new <<-CLOSET
You've entered the Closet.
CLOSET


entry.connect :north, living_room
entry.connect :up, landing
entry.connect :east, study
entry.connect :west, dining_room

dining_room.connect :north, kitchen
dining_room.connect :east, entry

study.connect :west, entry

kitchen.connect :north, pantry
kitchen.connect :east, living_room
kitchen.connect :south, dining_room

living_room.connect :north, sitting_room
living_room.connect :east, library
living_room.connect :south, entry
living_room.connect :west, kitchen

library.connect :north, guest_room
library.connect :east, half_bath
library.connect :west, living_room

half_bath.connect :west, library

pantry.connect :south, kitchen

sitting_room.connect :east, guest_room
sitting_room.connect :south, living_room

guest_room.connect :south, library
guest_room.connect :west, sitting_room

landing.connect :south, entry
landing.connect :west, master_bedroom

master_bedroom.connect :north, full_bath
master_bedroom.connect :east, landing

full_bath.connect :east, closet
full_bath.connect :south, master_bedroom

closet.connect :west, full_bath

puts entry.description
