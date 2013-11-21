require './greengrocer.rb'

describe Customer do
  let(:customer) { Customer.new }
  before { customer.generateCart }
  let(:cart) { customer.cart }

  describe '#generateCart' do
    it 'should create a cart with items in it' do
      expect(customer.cart).to be_a(Array)
    end
  end

  describe '#countCart' do
    it 'should count the number of each type of item in the cart' do
      customer.countCart
      let(:updated_cart) { customer.cart }
      expect(updated_cart.inject {|sum, item| sum + item[:count]}).to be(cart.size)
    end
  end
end