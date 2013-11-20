require './square_arrays_solution'

describe '#square_array' do
  it 'should return an array of squares' do
    expect(square_array([1,2,3,4])).to eq([1,4,9,16])
    expect(square_array([9,17,10])).to eq([81,289,100])
  end
end