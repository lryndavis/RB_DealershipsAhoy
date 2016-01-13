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

  def self.all
    @@dealerships
  end

  def self.clear
    @@dealerships = []
  end
end
