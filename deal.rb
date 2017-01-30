class Deal
  attr_accessor :quantity, :price_for_quantity

  def initialize(quantity, price_for_quantity)
    @quantity = quantity
    @price_for_quantity = price_for_quantity
  end
  
  def process(items, shopping_cart=nil)
    total = 0.0
    items.each_with_index do |item, i|
      total += item.price
      total -= item.price * (quantity - price_for_quantity) if (i + 1) % quantity == 0
    end

    return total
  end
end
