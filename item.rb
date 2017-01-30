class Item
  attr_accessor :product_code, :product_name, :price

  def initialize(product_code, product_name, price)
    @product_code = product_code
    @product_name = product_name
    @price = price
  end
  
  def set_price(price)
    self.price ||= price
  end
end
