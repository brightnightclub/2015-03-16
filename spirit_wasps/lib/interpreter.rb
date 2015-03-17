class Interpreter

  actions = {look, inspect, move, walk, go, jump}
  input = gets.split()

  input.each_cons(2) do |word, argument|
      if actions.has_key?(word)
        actions[word].use(argument)
      end
    break
  end
end
