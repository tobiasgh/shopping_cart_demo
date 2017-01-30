class PriceChecker
  attr_accessor :shopping_cart, :total

  def initialize(shopping_cart)
    @shopping_cart = shopping_cart
    @total = 0.0
  end

  def items
    shopping_cart.items
  end

  def pricing_rules
    shopping_cart.store.pricing_rules
  end

  def promos
    shopping_cart.store.promos
  end

  def promo_code
    shopping_cart.promo_code
  end

  def process
    process_sub_total
    process_discount
  end

  private

  def process_sub_total
    items.group_by(&:product_code).each do |product_code, item_group|
      self.total += ( match_pricing_rule(product_code).offer.process(item_group, shopping_cart) rescue item_group.map(&:price).inject(0, &:+) )
    end
  end

  def process_discount
    discount = match_promo.discount rescue 0.0
    self.total *= 1 - discount/100
  end

  def match_pricing_rule(product_code)
    pricing_rules.select { |pricing_rule| pricing_rule.item.product_code == product_code }.last
  end

  def match_promo
    promos.select { |promo| promo.promo_code == promo_code }.last
  end
end
