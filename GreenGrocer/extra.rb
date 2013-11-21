def updateCart(cart)
  cart.each do |item|
    item.each do |name, attributes|
      attributes[:count] = cart.select{|other_item| other_item == item}.size
    end
  end
  cart.uniq
end


def updateCart(cart)
  cart.each do |item|
    item.each do |name, attributes|
      duplicates = cart.select{|other_item| other_item == item}
      attributes[:count] = duplicates.size
      cart.map {|item| cart.delete(item) if item == duplicates.last}
    end
  end
  cart.uniq
end

# def updateCart(cart)
#   cart.each do |item|
#     item.each do |name, attributes|
#       duplicates = cart.select{|other_item| other_item == item}
#       p duplicates.size
#       attributes[:count] = duplicates.size
#       p item
#       p duplicates
#       cart.each do |item|
#         cart.delete(item) if duplicates.include?(item)
#       end
#     end
#   end
#   cart
# end

# a = generateCart
# p a
# p updateCart(a)
# p a