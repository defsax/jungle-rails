require 'rails_helper'

RSpec.feature "User can click a product and go to product detail page", type: :feature, js: true do

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

  xscenario "They are taken to product page" do
    #ACT
    visit root_path
    first('.product').click_link('Details')

    #DEBUG / VERIFY
    sleep(1)
    save_screenshot('product_details_test.png')

    #VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end
