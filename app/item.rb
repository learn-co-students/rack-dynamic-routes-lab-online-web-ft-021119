class Item
  attr_accessor :name, :price

  @@cart = []

  def initialize(name,price)
    @name = name
    @price = price
    @@cart << self
  end

  def self.all
    @@cart
  end

end
