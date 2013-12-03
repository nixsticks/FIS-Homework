require_relative '../lib/cell'
require_relative '../lib/grid'

describe 'game of life' do
  context 'live cell' do
    it 'dies if it has fewer than 2 neighbors' do
    end

    it 'dies if it has more than 3 neighbors' do
    end

    it 'lives if it has 2 or 3 neighbors' do
    end
  end

  context 'dead cell' do
    it 'lives if it has 3 neighbors' do
    end
  end
end

describe Cell do
  context 'cell methods' do
    let(:cell) {Cell.new}

    it 'should keep track of its live neighbors' do
      expect(cell.live_neighbors).to eq(0)
    end

    it 'should keep track of its alive or dead state' do

    end
  end
end

describe Grid do
  let(:grid) {Grid.new}

  it 'should keep track of all its cells' do
    expect(grid.cells).to be_a_kind_of(Array)
  end

  it 'should spawn a new live cell for empty positions with three live neighbors' do 
  end

  it 'should be able to tell its cells to check their neighbors and live or die' do
  end

  it 'should populate a new board by collecting live cells' do
    # should go through all its cells, check whether they're alive, and create a new board with the live cells plus any spawned ones.
    expect(grid.next_generation).to be_a_kind_of(Grid)
  end
end