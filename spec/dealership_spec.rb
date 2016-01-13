require('rspec')
require('dealership')

describe(Dealership) do
  describe('#name') do
    it('returns the name of a dealership') do
      expect(bobs_cars.name()).to(eq("Bob's Used Cars"))
    end
  end

  describe('#id') do
    it('will return the id of a dealership') do
      expect(bobs_cars.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it('returns an empty array of cars for the dealership') do
      expect(bobs_cars.cars()).to(eq([]))
    end
  end
end

def bobs_cars
  Dealership.new("Bob's Used Cars")
end
