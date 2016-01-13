require('rspec')
require('vehicle')

describe('#make') do
  it('returns the make of the vehicle') do
    expect(toyota_prius_2000().make()).to(eq("Toyota"))
  end
end

def toyota_prius_2000
  Vehicle.new("Toyota", "Prius", 2000)
end
