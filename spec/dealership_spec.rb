require('rspec')
require('dealership')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

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

  describe('#save') do
    it('will save a dealership to an array of dealerships') do
      test_dealership = bobs_cars
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Dealership.all()).to(eq([]))
    end
  end
  
  describe('.clear') do
    it('empties out the array of saved dealerships') do
      bobs_cars.save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end
end

def bobs_cars
  Dealership.new("Bob's Used Cars")
end
