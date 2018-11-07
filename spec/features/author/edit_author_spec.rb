require 'rails_helper'

describe 'Author edit page', type: :feature do

  before :each do
    @author = FactoryBot.create(:author)

  end

  it 'should render' do
    visit edit_author_path(@author)
  end
end