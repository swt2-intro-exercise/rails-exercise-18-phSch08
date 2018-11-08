require 'rails_helper'

describe 'Show paper page' do

  it 'should show authors' do
    alan = FactoryBot.create :author
    paper = FactoryBot.create :paper, authors: [alan]

    visit paper_path(paper)

    expect(page).to have_text(alan.name)
  end
end