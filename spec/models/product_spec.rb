require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # Before block to use the same Product object example for each test
    before do
      @category = Category.new(name: 'Example Category')
      @product = Product.new(
        name: 'Example Product',
        price: 100.00,
        quantity: 10,
        category: @category
      )
    end

    it 'is valid with all required fields' do
      expect(@product).to be_valid
    end

    it 'is not valid when name is nil' do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'is not valid when price is nil' do
      @product.price_cents = nil # Setting price_cents to nil simulates having price be nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'is not valid when quantity is nil' do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'is not valid when category is nil' do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Category must exist", "Category can't be blank"])
    end
  end
end