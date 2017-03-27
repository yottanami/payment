require 'spec_helper'
require 'payment'

describe 'Cart' do
  before(:each) do
    @cart = Payment::Cart.new
    @product1 = Payment::Product.new('001', 'Lavender heart', 9.25)
    @product2 = Payment::Product.new('002', 'Personalised cufflinks', 45.00)
    @product3 = Payment::Product.new('003', 'Kids T-shirt', 19.95)
    @promotion1 = Payment::Promotion.new('001', 0.75)
  end

  it 'initializes an empty cart' do
    expect(@cart.products).to be_empty
  end

  it 'adds a product to cart' do
    @cart.add(@product1)
    expect(@cart.products).to include(@product1)
  end

  it 'removes a product from cart' do
    @cart.add(@product1)
    @cart.remove(@product1)
    expect(@cart.products).not_to include(@product1)
  end

  it 'calculates total gross price before promotions' do
    @cart.add(@product1)
    @cart.add(@product2)
    @cart.add(@product3)
    expect(@cart.total_gross).to equal(@product1.price + @product2.price + @product3.price)
  end

  it 'testes sample case 1' do
    @cart.add(@product1)
    @cart.add(@product2)
    @cart.add(@product3)
    @cart.add_promotion(@promotion1)
    expect(@cart.total_net).to equal(66.78)
  end

  it 'testes sample case 2' do
    @cart.add(@product1)
    @cart.add(@product3)
    @cart.add(@product1)
    @cart.add_promotion(@promotion1)
    expect(@cart.total_net).to equal(36.95)
  end

  it 'testes sample case 3' do
    @cart.add(@product1)
    @cart.add(@product2)
    @cart.add(@product1)
    @cart.add(@product3)
    @cart.add_promotion(@promotion1)
    expect(@cart.total_net).to equal(73.76)
  end

  it 'calculates total price after discount' do
    @cart.add(@product1)
    @cart.add(@product2)
    @cart.add(@product3)
    expect(@cart.total_net).to equal(@cart.total_gross - (@cart.total_gross * 0.1))
  end
end
