require 'bike'

describe Bike do

  it 'has an attribute called working' do
    expect(subject).to have_attributes(:working => true)

  end

end
