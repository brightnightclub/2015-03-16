
require 'rspec'
require 'room'


describe(Room) do

  describe("#description") do
    it("will have a description") do
      room1 = Room.new({description: "demon bees"})
      expect(room1.description()).to(eq("demon bees"))
    end
  end

  # describe("#connect") do
  #   it("have a connection to another room") do
  #     room1 = Room.new({description: "demon bees"})
  #     room2 = Room.new({description: "demon babies"})
  #     room1.connect(:west, room2)
  #     expect(room1.doors(:west))
  #   end
  # end

end
