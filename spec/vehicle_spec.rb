require('rspec')
require('vehicle')

describe('#make') do
  it('returns the make of the vehicle') do
    expect(toyota_prius_2000().make()).to(eq("Toyota"))
  end
end

describe('#model') do
  it('returns the model of the vehicle') do
    expect(toyota_prius_2000().model()).to(eq("Prius"))
  end
end

describe('#year') do
  it('returns the year of the vehicle') do
    expect(toyota_prius_2000().year()).to(eq(2000))
  end
end

def toyota_prius_2000
  Vehicle.new("Toyota", "Prius", 2000)
end
