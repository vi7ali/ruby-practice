module Towable
  def can_tow?(kg)
    kg < 3000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@objects = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@objects += 1
  end

  def self.show_vehicles
    puts "#{@@objects} vehicles created"
  end

  def self.gas_mileage(liters, kilometers)
    puts "#{kilometers / liters} km per ltr of gas"
  end

  def speed_up(number)
    @speed += number
    puts "Accelerated to #{@speed}"
  end

  def brake(nunmber)
    @speed -= number
    puts "Slowed down to #{@speed}"
  end

  def current_speed
    puts "Current speed is #{@speed}"
  end

  def shut_down
    @speed = 0
    puts "Shutting down"
  end

  def spray_paint(color)
    self.color = color
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "Truck is #{self.model} of #{self.year} is #{self.color}"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "Car is #{self.model} of #{self.year} is #{self.color}"
  end
end