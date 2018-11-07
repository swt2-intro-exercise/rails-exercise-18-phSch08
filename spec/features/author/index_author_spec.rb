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
    expect(page).to have_link 'http://wikipedia.de/alan_turing', href: 'http://wikipedia.de/alan_turing'
  end

  it 'should list link to author' do
    expect(page).to have_link 'Show', href: author_path(@author)
  end

  it 'should have a link to create a new author' do
    expect(page).to have_link 'New', href: new_author_path
  end

  it 'should have a link to edit the author' do
    expect(page).to have_link 'Edit', href: edit_author_path(@author)
  end

  it 'should have a link to delete the author' do
    expect(page).to have_link 'Delete'
  end
end