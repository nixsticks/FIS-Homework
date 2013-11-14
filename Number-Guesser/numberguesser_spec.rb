require_relative './numberguesser.rb'

describe GuessingGame do

  let(:game) { GuessingGame.new }

  before(:each) do
    game.stub(:answer) { 63 }
  end

  it "tells you you are correct if you guess the right answer" do
    game.stub(:guess) { 63 }
    expect(game.run).to eq("Correct!")
  end

  it "tells you you were wrong if you guess the wrong answer" do
    game.stub(:guess) { 98 }
    expect(game.run).to eq("Wrong!")
  end

end
