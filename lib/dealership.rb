class Dealership
  @@dealerships = []

  def initialize(name)
    @name = name
    @id = @@dealerships.length() + 1
    @cars = []
  end

  def name
    @name
  end

  def id
    @id
  end

  def cars
    @cars
  end

  def save
    @@dealerships.push(self)
  end

  def add_vehicle(vehicle)
    @cars.push(vehicle)
  end

  def self.all
    @@dealerships
  end

  def self.clear
    @@dealerships = []
  end

  def self.find(id)
    found_dealership = nil
    @@dealerships.each() do |dealership|
      if dealership.id().eql?(id)
        found_dealership = dealership
      end
    end
    found_dealership
  end
end
