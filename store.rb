require './shopping_cart'

class Store
  attr_accessor :products, :pricing_rules, :promos
  
  def initialize(products=[], pricing_rules=[], promos=[])
    @products = products
    @pricing_rules = pricing_rules
    @promos = promos
  end
  
  def scenario1
    puts "Scenario 1"
    cart = ShoppingCart.new(self)

    3.times { cart.add(products[0]) }
    1.times { cart.add(products[2]) }

    puts cart.total
    cart.items.each { |item| puts item.product_name }
  end
  
  def scenario2
    puts "Scenario 2"
    cart = ShoppingCart.new(self)

    2.times { cart.add(products[0]) }
    4.times { cart.add(products[2]) }

    puts cart.total
    cart.items.each { |item| puts item.product_name }
  end
  
  def scenario3
    puts "Scenario 3"
    cart = ShoppingCart.new(self)

    1.times { cart.add(products[0]) }
    2.times { cart.add(products[1]) }

    puts cart.total
    cart.items.each { |item| puts item.product_name }
  end
  
  def scenario4
    puts "Scenario 4"
    cart = ShoppingCart.new(self)
    promo_code = 'I<3AMAYSIM'

    1.times { cart.add(products[0]) }
    1.times { cart.add(products[3], promo_code) }

    puts cart.total
    cart.items.each { |item| puts item.product_name }
  end
end
