require_relative 'bike'

class DockingStation
  attr_reader :bike, :bike_count, :capacity, :working_bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_count = []
  end

  def dock(bike)
    raise "Dock full!" if full?
    bike_count << bike
  end

  def release_bike
    raise "No more bikes!" if empty?

    index_to_release = ''

    @bike_count.each_with_index { |bike, index|
      index_to_release = index if bike.working == true
    }

      if index_to_release == ''
        raise "Sorry, no working bikes!"
      else
        @bike_count[index_to_release]
      end

  end

 private

 def full?
  bike_count.count >= DEFAULT_CAPACITY
  end

  def empty?
    bike_count.empty?
  end
end
