require 'rails_helper'

feature 'reviewing' do 
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'diabetes on a plate'
    select '2', from: 'Rating'
    click_button 'Leave Review'
    click_link 'KFC'
    # expect(current_path).to eq '/restaurants/1' --> DataCleaner
    expect(page).to have_content('diabetes on a plate')
  end
end