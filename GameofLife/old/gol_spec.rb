require_relative '../lib/game_of_life'

# describe Cell do
#   context 'alive' do
#     let(:cell) {Cell.new}

#     it 'should die if it has fewer than two live neighbors' do
#       cell.lives?
#       expect(cell.alive).to eq(false)
#     end

#     it 'should remain alive if it has two or three live neighbors' do
#     end

#     it 'should die if it has more than three live neighbors' do
#     end
#   end

#   context 'dead' do
#     it 'should come back to life if it has exactly three live neighbors' do
#     end
#   end
# end


describe 'game of life' do
  
  let(:world) {World.new}

  context 'cell utility methods' do
    
    subject {Cell.new(world)}

    it 'spawn relative to' do
      cell = subject.spawn_at(3,5)
      cell.is_a?(Cell).should be_true
      cell.x.should == 3
      cell.y.should == 5
      cell.world.should == subject.world
    end

    it 'detects a neighbor directly to the north' do
      cell = subject.spawn_at(0,1)
      subject.neighbors.count.should == 1
    end
  end

  it 'rule 1' do
    cell = Cell.new(world)
    cell.neighbors.count.should == 0
  end
end