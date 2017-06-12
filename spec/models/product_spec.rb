require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be true if name is present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category )
      expect(product).to(be_valid)
    end
     it 'should be true if price is present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category )
      expect(product).to(be_valid)
    end
     it 'should be true if quantity is present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category )
      expect(product).to(be_valid)
    end
     it 'should be true if category is present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category )
      expect(product).to(be_valid)
    end
    it 'should be false if name is not present' do
      category = Category.new(name: "apparel")
      product = Product.new( price: 1, quantity: 1, category: category )
      expect(product).to_not(be_valid)
    end
     it 'should be false if price is not present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', quantity: 1, category: category )
      expect(product).to_not(be_valid)
    end
     it 'should be false if quantity is not present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', price: 1, category: category )
      expect(product).to_not(be_valid)
    end
     it 'should be false if category is not present' do
      category = Category.new(name: "apparel")
      product = Product.new(name: 'a', price: 1, quantity: 1 )
      expect(product).to_not(be_valid)
    end
  end
end
