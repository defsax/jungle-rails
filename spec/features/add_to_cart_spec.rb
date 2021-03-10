require 'rails_helper'

RSpec.feature "Visitor can add to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create!(name: 'Apparel')

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  xscenario "Cart will increment by one" do
    #ACT
    visit root_path
    puts page.body
    first('.product').click_button('Add')

    #DEBUG / VERIFY
    sleep(5)
    save_screenshot('add_to_cart.png')

    #VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end
