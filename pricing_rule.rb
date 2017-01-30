class PricingRule
  attr_accessor :item, :offer

  def initialize(item, offer=nil)
    @item = item
    @offer = offer
  end
end
