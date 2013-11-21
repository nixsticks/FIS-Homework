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
  coupon_clearance
  coups = []
  rand(2).times do
    coups.push(COUPS.sample)
  end
  coups
  update_coupons_for_triple_discount(coups) if coups.size == 2
  # added logic even though coupon number can never be 2...
  coups
end

def update_coupons_for_triple_discount(coupons)
  if coupons[0] = coupons[1]
    coupons.delete_at(1)

    coupon = coupons[0]

    ITEMS.each do |items|
      items.each do |name, attributes|
        if coupon[:item] == name
          real_price = attributes[:price] * coupon[:num]
          new_price = coupon[:cost]
          percentage_discount = (real_price - new_price)/real_price
          coupon[:cost] = coupon[:cost] * (1 - (percentage_discount * 3))
        end
      end
    end
  end
  coupons
end

def checkout(cart, coupons)
  cost = 0.00
  cart.each do |item|
    item.each do |name, attribute|
      unless coupons.nil?
        coupons.each do |coupon|
          if name == coupon[:item] && attribute[:count] >= coupon[:num]
            cost += coupon[:cost] * (attribute[:count]/coupon[:num])
            attribute[:count] = attribute[:count] % coupon[:num]
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