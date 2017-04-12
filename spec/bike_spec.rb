require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
  #expect(bike).to be_working
end
