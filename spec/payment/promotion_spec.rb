require 'spec_helper'
require 'payment'

describe 'Promotion' do
  it 'creates a new promotion rule' do
    promotion = Payment::Promotion.new('001', 0.75)
    expect(promotion.code).to eq('001')
    expect(promotion.amount).to eq(0.75)
  end
end
