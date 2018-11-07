require 'rails_helper'

describe 'Author index page', type: :feature do

  before :each do
    @author = FactoryBot.create(:author)
    visit authors_path

  end

  #it 'should have a table' do
  #  expect(page).to have_table 'Name'
  #end

  it 'should list name of all authors' do
    expect(page).to have_text 'Alan Turing'
  end

  it 'should list link to the authors homepage' do
    expect(page).to have_link 'Homepage', href: 'http://wikipedia.org/Alan_Turing'
  end

  it 'should list link to author' do
    expect(page).to have_link 'Show', href: author_path(@author)
  end

  it 'should have a link to create a new author' do
    expect(page).to have_link 'New', href: new_author_path
  end
end