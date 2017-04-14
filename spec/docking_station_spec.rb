require 'docking_station'

describe DockingStation do

  it 'initializes an instance of DS with an argument' do
    ds = DockingStation.new(capacity = 50)
    expect(ds.capacity).to eq 50
  end

  it 'initializes an instance of DS with default argument' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to :release_bike }

  it 'checks that new bikes work' do
    bike = Bike.new
    expect(bike.working).to be true
  end

 it "releases same bike as docked" do
   bike = Bike.new
   subject.dock(bike)
   expect(subject.release_bike).to eq bike
  end

  it "doesn't release broken bikes" do
    bike = Bike.new
    bike.report_bike_broken
    #bike.working = false
    subject.dock(bike)
    expect{ subject.release_bike }.to raise_error "Sorry, no working bikes!"
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'docks working bike' do
    bike = Bike.new
    expect(subject.bike_count.count).to eq 0
    subject.dock(bike)
    expect(subject.bike_count.count).to eq 1
  end

  it 'docks broken bike' do
    bike = Bike.new
    bike.report_bike_broken
    #bike.working = false

    expect(subject.bike_count.count).to eq 0
    subject.dock(bike)
    expect(subject.bike_count.count).to eq 1
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq @bike_count
  end

  describe '#release_bike' do
    it 'gives an error when no more bikes' do
      expect{ subject.release_bike }.to raise_error "No more bikes!"
    end
  end

  describe '#dock' do
    it 'gives an error when dock full' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new

      end
    end
  end
end
