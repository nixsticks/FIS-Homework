require './remove_nils_solution.rb'

describe '#some_method' do
  it 'should return the sum of the array' do
    expect(some_method).to be(30)
  end

  it 'should not throw an exception' do
    expect{some_method}.not_to raise_error
  end
end