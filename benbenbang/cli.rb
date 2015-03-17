require 'dispatch'

class Cli
  attr_accessor :dispatch
  
  def initialize
    @dispatch = Dispatch.new
  end
  
  def start
    system("clear") or system("cls")
    puts 'Welcome to Ben Ben Bang!'
    
    infinity = true
    while infinity
      command = gets.chomp
      puts
      if command == 'exit' || command == 'quit' || command == 'oh god why stop it why'
        puts "Bang! You're dead."
        infinity = false
      else
        response = dispatch.execute command
        puts response
      end
    end
  end
end