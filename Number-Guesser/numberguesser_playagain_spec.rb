require_relative './numberguesser_playagain.rb'

describe GuessingGame do

  let(:game) { GuessingGame.new }

  it "tells you you are correct if you guess the right answer" do
    game.stub(:guess) { 64 }
    game.stub(:answer) { 64 }
    expect(game.result).to eq("Correct!")
  end
  
  it "tells you you were wrong if you guess the wrong answer" do
    game.stub(:guess) { 64 }
    game.stub(:answer) { 8 }
    expect(game.result).to eq("Wrong!")
  end

  it "asks you if you want to play again" do
    
  end
end
