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

def coupon_clearance
  COUPS.each do |coupon|
    ITEMS.each do |item|
      item.each do |name, values|
        coupon[:cost] = coupon[:cost] * 0.8 if name == coupon[:item] && values[:clearance]
      end
    end
  end
end

def generateCart
  coupon_clearance
  cart = []
  rand(1..20).times do
    cart.push(ITEMS.sample)  
  end
  cart
end

def updateCart(cart)
  cart.each do |item|
    item.each do |name, attributes|
      attributes[:count] = cart.select{|other_item| other_item == item}.size
    end
  end
  cart.uniq
end

def generateCoups
  coups = []
  rand(2).times do
    coups.push(COUPS.sample)
  end
  coups
  # unless coups.empty?
  #   tripleDiscount(coups)
  # else
  #   coups
  # end
end

# def tripleDiscount(coupons)
#   if coupons.size == 2 && coupons[0] == coupons[1]
#     coupons[0][:double] = true
#     coupons.delete_at(1)
#     coupon = coupons[0]
#     ITEMS.each do |item|
#       item.each do |name, attributes|
#         if name == coupon[:item]
#           original = (attributes[:price] * coupon[:num])
#           discount = (original - coupon[:price])/original
#           coupon[:price] = original * (discount * 3)
#         end
#       end
#     end
#   end
#   coupons
# end

def checkout(cart, coupons)
  cost = 0.00
  cart.each do |item|
    item.each do |name, attribute|
      unless coupons.nil?
        coupons.each do |coupon|
          if name == coupon[:item] && attribute[:count] >= coupon[:num]
            disc_number = attribute[:count]/coupon[:num]
            cost += coupon[:cost] * disc_number
            attribute[:count] -= coupon[:num] * disc_number
          end
        end
      end
      if attribute[:clearance]
        cost += (attribute[:price] * attribute[:count]) * 0.8
      else
        cost += attribute[:price] * attribute[:count]
      end
    end
  end

  over_5 = false

  cart.each do |item|
    item.each do |name, attribute| 
      over_5 = true if attribute[:price] > 5
    end
  end

  cost -= 10 unless over_5 || cost <= 10
  
  cost
end