class Promo
  attr_accessor :promo_code, :discount

  def initialize(promo_code, discount)
    @promo_code = promo_code
    @discount = discount
  end
end
