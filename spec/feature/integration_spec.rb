# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'flash notice sunny' do
    visit new_book_path
    fill_in "book[title]", with: 'test sunny book'
    click_on 'Create Book'
    visit books_path
    expect(controller).to set_flash[:notify]
  end

  scenario 'flash notice rainy' do
    visit new_book_path
    click_on 'Create Book'
    visit books_path
    expect(controller).to set_flash[:alert]
  end
end

