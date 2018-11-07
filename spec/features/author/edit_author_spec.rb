require 'rails_helper'

describe 'Author edit page', type: :feature do

  before :each do
    @author = FactoryBot.create(:author)

  end

  it "should render" do
    visit edit_author_path(@author)
  end

  it "should show authors name" do
    visit edit_author_path(@author)

    expect(page).to have_text(@author.name)
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit edit_author_path(@author)

    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

    puts @author.first_name.to_yaml
  it "should save changes" do
    visit edit_author_path(@author)

    page.fill_in 'author[first_name]', with: 'Alan Mathison'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'

    find('input[type="submit"]').click
  end

end