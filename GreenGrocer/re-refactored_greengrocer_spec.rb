require './re-refactored_greengrocer'

describe '#update_cart' do
  let(:old_cart) {generate_cart}
  let(:updated_cart) {update_cart_counts(old_cart, count_cart_items(old_cart))}
  n = 0
  before do 
    updated_cart.each do |item|
      item.each {|name,attributes| n += attributes[:count]}
    end
  end

  it 'should update the cart with number of items and delete duplicates' do
    expect(n).to eq(old_cart.size)
  end

  # it 'should update the cart with number of items' do
  #   expect([{"AVOCADO" => {:price => 3.00, :clearance => true}},{"KALE" => {:price => 3.00,:clearance => false}},{"BLACK_BEANS" => {:price => 2.50,:clearance => false}},{"AVOCADO" => {:price => 3.00, :clearance => true}}]).to eq([{"AVOCADO" => {:price => 3.00, :clearance => true, :count => 2}},{"KALE" => {:price => 3.00,:clearance => false, :count => }},{"BLACK_BEANS" => {:price => 2.50,:clearance => false}}])
  # end
end

# describe '#tripleDiscount' do
#   let(:coups) { [{:item=>"AVOCADO", :num=>2, :cost=>5.00}, {:item=>"AVOCADO", :num=>2, :cost=>5.00}] }
#   it 'should add a count to the coupons' do
#     expect(tripleDiscount(coups)).to eq([{:item=>"AVOCADO", :num=>2, :cost=>3.00, :count=>2}])
#   end
# end

describe '#checkout' do
  context 'with coupon and exact number of items and no clearance' do
    let(:cart) { [{"BLACK_BEANS"=>{:price=>2.5, :clearance=>false, :count=>2}}, {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>false, :count=>1}}, {"ALMONDS"=>{:price=>9.0, :clearance=>false, :count=>1}}, {"AVOCADO"=>{:price=>3.0, :clearance=>false, :count=>2}}] }
    let(:coups) {[  {:item=>"AVOCADO", :num=>2, :cost=>4.00}]}

    it 'should calculate price with discounts' do
      expect(checkout(cart, coups)).to eq(21)
    end
  end

  context 'with coupon and more than required items and clearance' do
    let(:cart) { [{"BLACK_BEANS"=>{:price=>2.5, :clearance=>false, :count=>2}}, {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>false, :count=>1}}, {"ALMONDS"=>{:price=>9.0, :clearance=>false, :count=>1}}, {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>5}}] }
    let(:coups) {[  {:item=>"AVOCADO", :num=>2, :cost=>4.00}]}

    it 'should calculate price with discounts and full price for extra items' do
      expect(checkout(cart, coups)).to eq(28.2)
    end
  end

  context 'with coupon but not enough items and no clearance' do
    let(:cart) { [{"BLACK_BEANS"=>{:price=>2.5, :clearance=>false, :count=>2}}, {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>false, :count=>1}}, {"ALMONDS"=>{:price=>9.0, :clearance=>false, :count=>1}}, {"AVOCADO"=>{:price=>3.0, :clearance=>false, :count=>1}}] }
    let(:coups) {[  {:item=>"AVOCADO", :num=>2, :cost=>4.00}]}

    it 'should calculate full price' do
      expect(checkout(cart, coups)).to eq(20)
    end
  end

  context 'with coupon but no items and no clearance and under $10 total with all under 5' do
    let(:cart) {[{"KALE" => {:price => 3.00,:clearance => false, :count => 1}}, {"BLACK_BEANS" => {:price => 2.50,:clearance => false, :count => 2}}]}
    let(:coups) {[{:item=>"AVOCADO", :num=>2, :cost=>4.00}]}

    it 'should calculate full price' do
      expect(checkout(cart, coups)).to eq(8)
    end
  end

  context 'with coupons and discount and clearance' do
    let(:cart) { [{"BLACK_BEANS"=>{:price=>2.5, :clearance=>false, :count=>2}}, {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>false, :count=>2}}, {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>2}}] }
    let(:coups) {[  {:item=>"AVOCADO", :num=>2, :cost=>4.00}]}    

    it 'should give 20% off along with coupon and under-5 discount' do
      expect(checkout(cart, coups)).to eq(5)
    end
  end

  context 'with no coupons and no discount and no clearance' do
    let(:cart) { [{"BLACK_BEANS"=>{:price=>2.5, :clearance=>false, :count=>2}}, {"PEANUTBUTTER"=>{:price=>3.0, :clearance=>false, :count=>1}}, {"ALMONDS"=>{:price=>9.0, :clearance=>false, :count=>1}}, {"AVOCADO"=>{:price=>3.0, :clearance=>false, :count=>1}}] }
    let(:coups) {[  {:item=>"AVOCADO", :num=>2, :cost=>4.00}]}   

    it 'should calculate full price' do
      expect(checkout(cart, coups)).to eq(20)
    end
  end
end