require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with all required fields' do
      category = Category.new(name: 'Example Category')
      product = Product.new(
        name: 'Example Product',
        price: 100.00,
        quantity: 10,
        category: category
      )
      expect(product).to be_valid
    end

    it 'is not valid when name is nil' do
      category = Category.new(name: 'Example Category')
      product = Product.new(
        name: nil,
        price: 100.00,
        quantity: 10,
        category: category
      )
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to eq(["Name can't be blank"])
    end
  end
end