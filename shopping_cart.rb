require './price_checker'

class ShoppingCart
  attr_accessor :items, :store, :promo_code

  def initialize(store)
    @items = []
    @store = store
    @promo_code = nil
  end

  def add(item, promo_code=nil)
    items << item
    self.promo_code ||= promo_code
  end

  def total
    price_checker = PriceChecker.new(self)
    price_checker.process
    price_checker.total.round(2)
  end
end
