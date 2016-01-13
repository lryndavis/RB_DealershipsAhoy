require('rspec')
require('vehicle')

describe(Vehicle) do
  before() do
    Vehicle.clear()
  end

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

  describe('.all') do
    it('is empty at first') do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a vehicle to the array') do
      test_vehicle = toyota_prius_2000()
      test_vehicle.save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe('#clear') do
    it('will clear the array') do
      toyota_prius_2000().save()
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('will create a unique id for each vehicle') do
      test_vehicle = toyota_prius_2000
      test_vehicle.save()
      expect(test_vehicle.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('will return a vehicle by its id number') do
      test_vehicle = toyota_prius_2000
      test_vehicle.save()
      test_vehicle2 = Vehicle.new("Toyota", "Yaris", 2013)
      test_vehicle2.save()
      expect(Vehicle.find(test_vehicle.id())).to(eq(test_vehicle))
    end
  end
end

def toyota_prius_2000
  Vehicle.new("Toyota", "Prius", 2000)
end
