require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike_count = []
  end

  def dock(bike)
    raise "Dock full!" if @bike_count.count == 20
    @bike_count << bike
  end

  def release_bike
    raise "No more bikes!" unless @bike_count.count > 0
    @bike_count.pop
  end
end
