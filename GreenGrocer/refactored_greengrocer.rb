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

#randomly generates a cart of items
def generateCart
  cart = []
  rand(1..20).times do
    cart.push(ITEMS.sample)  
  end
  cart
end

#randomly generates set of coupons
def generateCoups
  updateCoups
  coups = []
  rand(2).times do
    coups.push(COUPS.sample)
  end
  coups
end

#updates coupons to reflect discount
def updateCoups
  COUPS.each do |coupon|
    ITEMS.each do |items|
      items.each do |name, attributes|
        coupon[:cost] = coupon[:cost] * 0.8 if coupon[:item] == name && attributes[:clearance] == true
      end
    end
  end
end

#returns count of items in cart
def uniqCart(cart)
  counts = {}
  cart.each do |item|
    item.each do |name, attributes|
      counts[name] = cart.select{|other_item| other_item == item}.size
    end
  end
  counts
end

#adds count to the items in the cart
def updateCart(cart, counts)
  cart.uniq!
  cart.each do |item|
    item.each do |name, attributes|
      counts.each do |item2, number|
        attributes[:count] = number if item2 == name
      end
    end
  end
end

#changes price for couponed items
def couponItems(cart, coupons)
  cost = 0
  cart.each do |item|
    item.each do |name, attributes|
      unless coupons.nil?
        coupons.each do |coupon|
          if name == coupon[:item] && attributes[:count] >= coupon[:num]
            disc_number = attributes[:count]/coupon[:num]
            cost += coupon[:cost] * disc_number
            attributes[:count] -= coupon[:num] * disc_number
          end
        end
      end
    end
  end
  cost
end

#gives clearance discount and normal cost
def clearance(cart, cost)
  cart.each do |item|
    item.each do |name, attribute|
      if attribute[:clearance]
        cost += (attribute[:price] * attribute[:count]) * 0.8
      else
        cost += attribute[:price] * attribute[:count]
      end
    end
  end
  cost
end

#gives over 5 discount
def over_5_discount(cart, cost)
  over_5 = false

  cart.each do |item|
    item.each do |name, attribute| 
      over_5 = true if attribute[:price] > 5
    end
  end

  over_5 || cost <= 10 ? cost : cost - 10
end

def checkout(cart, coupons)
  no_coupons = couponItems(cart, coupons)
  clearance = clearance(cart, no_coupons)
  over_5_discount(cart, clearance)
end

##the cart is currently an array of individual items, translate it into a hash that includes the counts for each item
  # For example if your cart was [  {"AVOCADO" => {:price => 3.00, :clearance => true}}, {"AVOCADO" => {:price => 3.00, :clearance => true}}]
  # it would become {"AVOCADO" => {:price => 3.00, :clearance => true}, :count => 2}
##create a checkout method that calculates the total cost of the cart
##when checking out, check the coupons and apply the discount if the proper number of items is present
##if any of the items are on clearance add a 20% discount
##if the customer has 2 of the same coupon, triple the discount
##if none of the items purchased have a unit price greater than 5$ give the customer a 10$ discount off the whole cart
