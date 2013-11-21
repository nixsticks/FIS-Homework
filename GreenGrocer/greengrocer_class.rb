class GreenGrocer
  ITEMS = [  {"AVOCADO" => {:price => 3.00, :clearance => true}},
    {"KALE" => {:price => 3.00,:clearance => false}},
    {"BLACK_BEANS" => {:price => 2.50,:clearance => false}},
    {"ALMONDS" => {:price => 9.00, :clearance => false}},
    {"TEMPEH" => {:price => 3.00,:clearance => true}},
    {"CHEESE" => {:price => 6.50,:clearance => false}},
    {"BEER" => {:price => 13.00, :clearance => false}},
    {"PEANUTBUTTER" => {:price => 3.00,:clearance => true}},
    {"BEETS" => {:price => 2.50,:clearance => false}}]

  COUPS = [  {:item=>"AVOCADO", :num=>2, :cost=>5.00},
    {:item=>"BEER", :num=>2, :cost=>20.00},
    {:item=>"CHEESE", :num=>3, :cost=>15.00}]
end

class Customer
  attr_accessor :cart, :coupons
#randomly generates a cart of items

  def initialize
    @cart = []
    @coupons
  end

  def generateCart
    rand(20).times do
      @cart.push(GreenGrocer::ITEMS.sample)  
    end
  end

  def countCart
    
  end

  #randomly generates set of coupons
  def generateCoups
    coups = []
    rand(2).times do
      coups.push(COUPS.sample)
    end
    coups
  end
end

nikki = Customer.new
nikki.generateCart
nikki.countCart

puts nikki.cart


# i = 0; j = 1
#     while i < cart.length do
#       cart[i][:count] ||= 1
#       until j == cart.length do
#         return if cart[j].nil?
#         if cart[i] == cart[j]
#           cart[i][:count] += 1
#           cart.delete_at(j)
#           j += 1
#         end
#       end
#       i += 1
#     end


   # i=0
    # j=1

    # while i < 20 do
    #   return if cart[i].nil?
    #   while j < 19
    #     cart[i][:count] ||= 0
    #     if cart[i] == cart[j]
    #       cart[i][:count] += 1
    #       cart.delete_at(j)
    #       i += 1
    #       j += 1
    #     end
    #   end
    # end

    # cart.each do |item|
    #   item[:count] ||= 0
    #   cart.each do |other_item|
    #     item[:count] += 1 if item == other_item 
    #     cart.delete(other_item)
    #   end
    # cart