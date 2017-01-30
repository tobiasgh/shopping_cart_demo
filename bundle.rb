class Bundle
  attr_accessor :bundled_item, :price

  def initialize(bundled_item, price)
    @bundled_item = bundled_item
    @price = price
  end

  def process(items, shopping_cart=nil)
    items.size.times { shopping_cart.add(bundled_item) }
    items.map(&:price).inject(0, &:+)
  end
end
