require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    
    it "should save a valid product" do
      @category = Category.create(name: "Food")
      product = Product.new(
        name: "Apple",
        price: 11.84,
        quantity: 12,
        category_id: @category.id 
      )
      expect(product).to (be_valid)
    end
    
    it 'should validate name' do
      @category = Category.create(name: "Food")
      name = Product.new(
        name: nil,
        price: 11.84,
        quantity: 12,
        category_id: @category.id 
      )
      expect(name).to_not (be_valid)
    end
  
    it 'should validate price' do
      @category = Category.create(name: "Food")
      price = Product.new(
        name: "Apple",
        price: nil,
        quantity: 12,
        category_id: @category.id 
      )
      expect(price).to_not (be_valid)
    end

    it 'should validate quantity' do
      @category = Category.create(name: "Food")
      quantity = Product.new(
        name: "Apple",
        price: 11.84,
        quantity: nil,
        category_id: @category.id 
      )
      expect(quantity).to_not (be_valid)
    end

    it 'should validate category' do
      category = Product.new(
        name: "Apple",
        price: 11.84,
        quantity: 12,
        category_id: nil 
      )
      expect(category).to_not (be_valid)
    end
  end
end
