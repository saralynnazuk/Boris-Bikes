class Bike
  attr_accessor :working

  def initialize(working = true)
    @working = working
  end

  def report_bike_broken
    @working = false
  end

end
