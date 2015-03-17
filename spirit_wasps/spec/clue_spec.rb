require 'rspec'
require 'clue'

describe Clue do
  describe 'creating clues' do
    it 'can accept a block' do
      clue = Clue.new({}) do |room, detective|
        'hello'
      end
      expect(clue.use).to eq('hello')
    end
  end
end
