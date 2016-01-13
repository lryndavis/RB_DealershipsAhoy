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

end
