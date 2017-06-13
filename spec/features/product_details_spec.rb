require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
      scenario "They click on a product" do
    visit root_path
    # click_img ""
    sleep 2
    first('article.product').find_link('Details »').click
    sleep 2

    # commented out b/c it's for debugging only
    save_and_open_screenshot

    expect(page).to have_css "article.product-detail"
  end
end
