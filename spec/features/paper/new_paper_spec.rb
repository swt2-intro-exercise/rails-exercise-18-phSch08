require 'rails_helper'

describe "New paper page", type: :feature do

  it "should render withour error" do
    visit new_paper_path
  end

  it "should have text inputs for title, venue and year" do
    visit new_paper_path

    # these are the standard names given to inputs by the form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save the paper" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'dumb things'
    page.fill_in 'paper[venue]', with: 'dumb city'
    page.fill_in 'paper[year]', with: '2015'

    find('input[type="submit"]').click
  end

  it "should show validation errors without title" do
    visit new_paper_path

    page.fill_in 'paper[venue]', with: 'dumb city'
    page.fill_in 'paper[year]', with: '2015'

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end

  it "should show validation errors without venue" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'dumb things'
    page.fill_in 'paper[year]', with: '2015'

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end

  it "should show validation errors without year" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'dumb things'
    page.fill_in 'paper[venue]', with: 'dumb city'

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end

  it "should show validation errors when year is not an integer" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'dumb things'
    page.fill_in 'paper[venue]', with: 'dumb city'
    page.fill_in 'paper[year]', with: 'milchreis'

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end
end