class Alive
  def flip_state(living)
    if living == 2 or living == 3
      self
    else
      Dead.new
    end
  end
end

class Dead
  def flip_state(living)
    living == 3 ? Alive.new : self
  end
end