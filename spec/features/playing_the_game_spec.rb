require 'spec_helper'

feature 'Playing the game' do

  before do
    visit '/'
    fill_in 'player', :with => 'Michael'
    click_button 'Play!'
    fill_in 'position', :with => 'A1'
    click_button 'Submit'
    fill_in 'position', :with => 'B1'
    click_button 'Submit'
    fill_in 'position', :with => 'C1'
    click_button 'Submit'
    fill_in 'position', :with => 'D1'
    click_button 'Submit'
    fill_in 'position', :with => 'E1'
    click_button 'Submit'
    click_button 'Start the game!'
  end

  scenario 'displays two boards' do
    expect(page).to have_content("++", :count => 100)
  end

end