require 'payment/version'

module Payment
  autoload :Product, 'payment/product'
  autoload :Cart, 'payment/cart'
  autoload :Promotion, 'payment/promotion'
  autoload :Discount, 'payment/discount'
end
