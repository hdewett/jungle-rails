require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should save a new product with all fields present' do
      @category = Category.new(name: 'Grass')
      @product = Product.new(name: 'plant', price: '10', quantity: 5, category: @category)
      @product.save

      expect(@product.save).to be true
    end

    it 'should be invalid without a name' do
      @category = Category.new(name: 'Grass')
      @product = Product.new(name: nil, price_cents: '10', quantity: 5, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should be invalid without a price' do
      @category = Category.new(name: 'Grass')
      @product = Product.new(name: 'plant', price_cents: nil, quantity: '5', category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should be invalid without a quantity' do
      @category = Category.new(name: 'Grass')
      @product = Product.new(name: 'plant', price_cents: '10', quantity: nil, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should be invalid without a category' do
      @category = Category.new(name: 'Grass')
      @product = Product.new(name: 'plant', price_cents: '10', quantity: '5', category: nil)
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
