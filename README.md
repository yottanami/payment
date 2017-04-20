# Payment
[![Build Status](https://travis-ci.org/msdundar/payment.svg?branch=master)](https://travis-ci.org/msdundar/payment)
[![Code Climate](https://img.shields.io/codeclimate/github/msdundar/payment.svg)](https://codeclimate.com/github/msdundar/payment)

**payment** is a sample Ruby application used to manage products, discounts and promotions.

* Works fine with `Ruby 2.4.1` and other versions are not tested yet.

# Usage

* Run `bundle install` to setup necessary GEMs.

* Run IRB with `rake console` for interactive console.

Create a shopping cart first:

```ruby
cart = Payment::Cart.new
```

Create some products for testing:

```ruby
product1 = Payment::Product.new('001', 'Lavender heart', 9.25)
product2 = Payment::Product.new('002', 'Personalised cufflinks', 45.00)
product3 = Payment::Product.new('003', 'Kids T-shirt', 19.95)
```

Create a new promotion! Below there is an example for product with 001 code. If a user adds more than 2 products with 001 code, a reduction of 0.75 applies to each product.

```ruby
promotion = Payment::Promotion.new('001', 0.75)
```

Add products to the cart:

```ruby
cart.add product1
cart.add product2
cart.add product1
cart.add product3
```

Apply promotion to the cart:

```ruby
cart.add_promotion promotion
```

Check total price (net):

```ruby
cart.total_net # 73.76£
```

Check total price (gross):

```ruby
cart.total_gross # 83.45£
```

Keep promotion rule, but do not apply it to the current cart:

```ruby
cart.remove_promotion promotion
cart.total_net # 75.11£
```

## Tests and Status

Currently, all tests are passing with awesome 'green'. Run `bundle exec rspec` for tests and `rubocop` for code quality.

Code quality is checked with [Rubocop](https://github.com/bbatsov/rubocop), [TravisCI](https://travis-ci.org/) and [CodeClimate](https://codeclimate.com/).

[![Build Status](https://secure.travis-ci.org/msdundar/payment.svg?branch=master)](http://travis-ci.org/msdundar/payment) [![Code Climate](https://img.shields.io/codeclimate/github/msdundar/payment.svg)](https://codeclimate.com/github/msdundar/payment)

## Contributing

1. `fork` the repo ( https://github.com/msdundar/payment/fork )
2. Create a branch (git checkout -b cool-feature)
3. Commit the changes (git commit -am 'My cool features')
4. Push the branch (git push origin cool-feature)
5. Make a pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Questions

```
msdundars@gmail.com
```
