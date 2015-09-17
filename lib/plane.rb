require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def land
    @flying = false
    self
  end

  def fly
    @flying = true
    self
  end

  def status
    flying? ? "flying" : "landed"
  end

  def flying?
    @flying
  end

  def landed?
    !flying?
  end

end
