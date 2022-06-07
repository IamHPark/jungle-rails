require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be saved with all fields' do
      @category = Category.new
      product = Product.new(name: "Eesrorn", category: @category, price: 13.5, quantity: 20)
      expect(product).to be_valid
    end

    it 'should have a name' do
      product = Product.new
      product.validate
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price' do
      product = Product.new
      product.validate
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a category' do
      product = Product.new
      product.validate
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

    it 'should have a quantity' do
      product = Product.new
      product.validate
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
end
