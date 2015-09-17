class Weather

  attr_reader :status

  def initialize
    @status = "sunny"
  end

  def current_weather
    randomizer <= 2 ? @status = "sunny" : @status = "stormy"
  end

  def randomizer
    rand(5)
  end

end