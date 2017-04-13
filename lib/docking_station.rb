require_relative 'bike'

class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20



  def initialize#(capacity)
    #@capacity = capacity
    @bike_count = []
  end

  def dock(bike)
    raise "Dock full!" if full?
    @bike_count << bike
  end

  def release_bike
    raise "No more bikes!" if empty?
    @bike_count.pop
  end

 private

 def full?
  @bike_count.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_count.empty?
  end
end
