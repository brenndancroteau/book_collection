# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter')
  end

  it 'is valid with valid attributes' do
    subject.title = 'test'
    subject.author = 'test'
    subject.price = 5.0
    subject.published = '2024-01-01'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    subject.author = 'test'
    subject.price = 5.0
    subject.published = '2024-01-01'
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author' do
    subject.title = 'test'
    subject.author = nil
    subject.price = 5.0
    subject.published = '2024-01-01'
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.title = 'test'
    subject.author = 'test'
    subject.price = nil
    subject.published = '2024-01-01'
    expect(subject).not_to be_valid
  end

  it 'is not valid without a published-date' do
    subject.title = 'test'
    subject.author = 'test'
    subject.price = 5.0
    subject.published = nil
    expect(subject).not_to be_valid
  end
  
end