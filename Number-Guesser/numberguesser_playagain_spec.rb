require_relative './numberguesser_playagain.rb'

describe GuessingGame do

  let(:game) { GuessingGame.new }
  let(:guess) {64}
  let(:answer) { 64 }

  it "tells you you are correct if you guess the right answer" do
    expect(game.result).to eq("Correct!")
  end

  let(:guess) {72}
  let(:answer) {99}
  
  it "tells you you were wrong if you guess the wrong answer" do
    game.stub(:guess) { 98 }
    expect(game.result).to eq("Wrong!")
  end

end
