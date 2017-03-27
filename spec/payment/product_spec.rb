require 'spec_helper'
require 'payment'

describe 'Product' do
  it 'creates a new product' do
    product = Payment::Product.new('001', 'Lavender heart', 9.25)
    expect(product.code).to eq('001')
    expect(product.name).to eq('Lavender heart')
    expect(product.price).to eq(9.25)
  end
end
