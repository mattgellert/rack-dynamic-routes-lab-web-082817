class Item
  attr_accessor :name, :price

  ALL = []

  def initialize(name,price)
    @name = name
    @price = price
    ALL << self
  end

  def self.all
    ALL
  end
end
