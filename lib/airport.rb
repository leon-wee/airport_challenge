require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50

  attr_reader :capacity, :weather

  def initialize(weather)
    @airport_space = []
    @capacity = DEFAULT_CAPACITY
    @weather = weather
  end

  def landing(plane)
    @airport_space << plane.land if clear_for_landing
  end

  def clear_for_landing
    fail "Can't land in storm" if stormy?
    fail "Airport is full" if full?
    true
  end

  def plane_takes_off
    fail "Can't take off in storm" if stormy?
    fail "Airport empty" if empty?
    plane = @airport_space.pop.fly
  end

  def empty?
    @airport_space.empty?
  end

  private

  def stormy?
    weather == "stormy"
  end

  def full?
    @airport_space.length >= DEFAULT_CAPACITY
  end
end
