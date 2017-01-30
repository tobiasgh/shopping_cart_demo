class BulkDiscount
  attr_accessor :minimum, :price

  def initialize(minimum, price)
    @minimum = minimum
    @price = price
  end
  
  def process(items, shopping_cart=nil)
    items.size > minimum ? price * items.size : items.map(&:price).inject(0, &:+)
  end
end
