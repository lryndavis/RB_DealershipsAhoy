class Vehicle
  @@vehicles = []

  def initialize(make, model, year, dealership_id)
    @make = make
    @model = model
    @year = year
    @id = @@vehicles.length() + 1
    @dealership_id = dealership_id
  end

  def make
    @make
  end

  def model
    @model
  end

  def year
    @year
  end

  def id
    @id
  end

  def dealership_id
    @dealership_id
  end

  def self.all
    @@vehicles
  end

  def save
    @@vehicles.push(self)
  end

  def self.clear
    @@vehicles = []
  end

  def self.find(identification)
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end
end
