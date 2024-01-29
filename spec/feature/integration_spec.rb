# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'test'
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'flash notice title sunny' do
    visit new_book_path
    fill_in "book[title]", with: 'test'
    fill_in "book[author]", with: 'test sunny author'
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Book Created Successfully!")
  end

  scenario 'flash notice title rainy' do
    visit new_book_path
    fill_in "book[title]", with: ""
    fill_in "book[author]", with: ''
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Failed to Add Book.")
  end

  scenario 'flash notice author sunny' do
    visit new_book_path
    fill_in "book[title]", with: 'test'
    fill_in "book[author]", with: 'test sunny author'
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Book Created Successfully!")
  end

  scenario 'flash notice author rainy' do
    visit new_book_path
    fill_in "book[title]", with: "test rainy author"
    fill_in "book[author]", with: ''
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Failed to Add Book.")
  end

  scenario 'flash notice price sunny' do
    visit new_book_path
    fill_in "book[title]", with: 'test sunny price'
    fill_in "book[author]", with: 'test'
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Book Created Successfully!")
  end

  scenario 'flash notice price rainy' do
    visit new_book_path
    fill_in "book[title]", with: "test"
    fill_in "book[author]", with: 'test rainy price'
    fill_in "book[price]", with: ''
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Failed to Add Book.")
  end

  scenario 'flash notice published-date sunny' do
    visit new_book_path
    fill_in "book[title]", with: 'test published-date sunny'
    fill_in "book[author]", with: 'test'
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: '2024-01-01'
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Book Created Successfully!")
  end

  scenario 'flash notice published-date rainy' do
    visit new_book_path
    fill_in "book[title]", with: "test published-date rainy"
    fill_in "book[author]", with: 'test'
    fill_in "book[price]", with: 5.0
    fill_in "book[published]", with: ''
    click_on 'Create Book'
    expect(page).to have_css('div', text: "Failed to Add Book.")
  end

end
