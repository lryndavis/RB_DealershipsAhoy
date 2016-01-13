require('rspec')
require('dealership')
require('vehicle')

describe(Dealership) do
  describe('#name') do
    it('returns the name of a dealership') do
      expect(bobs_cars.name()).to(eq("Bob's Used Cars"))
    end
  end
end

def bobs_cars
  Dealership.new("Bob's Used Cars")
end
