class Alive
  def flip_state(living)
    if living == 2 or living == 3
      Alive.new
    else
      Dead.new
    end
  end
end

class Dead
  def flip_state(living)
    living == 3 ? Alive.new : Dead.new
  end
end



# require 'delegate'

# class TicketSeller
#   def sellTicket()
#     return 'Here is a ticket'
#   end
# end

# class NoTicketSeller
#   def sellTicket()
#     "Sorry-come back tomorrow"
#    end
# end

# class TicketOffice < SimpleDelegator
#   def initialize
#     @seller = TicketSeller.new
#     @noseller = NoTicketSeller.new
#     super(@seller)
#   end
#   def allowSales(allow = true)
#     __setobj__(allow ? @seller : @noseller)
#     allow
#   end
# end

# to = TicketOffice.new
# to.sellTicket → "Here is a ticket"
# to.allowSales(false) → false
# to.sellTicket → "Sorry-come back tomorrow"
# to.allowSales(true) → true
# to.sellTicket → "Here is a ticket"


# class FireballMove
#   def say()
#     return "HaDoKen!"
#   end
#   def nextState( context, move, action )
#     if (move.down()) then
#       return FireballHa.new()
#     end
#     return FireballMove.new()
#   end
# end

# class FireballHa
#   def nextState( context, move, action )
#     if (move.downForward()) then
#       return FireballDo.new()
#     elsif (move.down()) then
#       return FireballHa.new()
#     end
#     return FireballMove.new()
#   end
# end

# class FireballDo
#   def nextState( context, move, action )
#     if (move.forward() && action.punch()) then
#       context.execute(FireballMove.new())
#     end
#     return FireballMove.new()
#   end
# end