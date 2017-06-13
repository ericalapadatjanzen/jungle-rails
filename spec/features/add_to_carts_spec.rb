require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

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

    scenario "They add something to the cart" do
    visit root_path

    first('article.product').find_link('Add').click
    # commented out b/c it's for debugging only
    save_and_open_screenshot

    expect(page).to have_content "My Cart (1)"
  end
end
