require './store'
require './item'
require './promo'
require './pricing_rule'
require './deal'
require './bundle'
require './bulk_discount'

products = [
  Item.new('ult_small', 'Unlimited 1GB', 24.9),
  Item.new('ult_medium', 'Unlimited 2GB', 29.9),
  Item.new('ult_large', 'Unlimited 5GB', 44.9),
  Item.new('1gb', '1 GB Data-pack', 9.9)
]

pricing_rules = [
  PricingRule.new(products[0], Deal.new(3, 2)),
  PricingRule.new(products[1], Bundle.new(products[3], 0.0)),
  PricingRule.new(products[2], BulkDiscount.new(3, 39.9))
]

promos = [
  Promo.new('I<3AMAYSIM', 10.0)
]

store = Store.new(products, pricing_rules, promos)

store.scenario1
store.scenario2
store.scenario3
store.scenario4
