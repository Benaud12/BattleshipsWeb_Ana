require 'spec_helper'

feature 'Starting a new game' do

  scenario 'I am asked to enter my name' do
    visit '/'
    click_button 'Play!'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Asks for an actual name to be entered' do
    visit '/'
    fill_in 'player', :with => ''
    click_button 'Play!'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Shows a battleships board to new player' do
    visit '/'
    fill_in 'player', :with => 'Michael'
    click_button 'Play!'
    expect(page).to have_content("~~", :count => 100)
  end

  scenario 'displays welcome message when board is empty' do
    visit '/'
    fill_in 'player', :with => 'Michael'
    click_button 'Play!'
    expect(page).to have_content "Welcome to the game, Michael!"
  end

  scenario 'we can place a ship on the board horizontally' do
    visit '/'
    fill_in 'player', :with => 'Michael'
    click_button 'Play!'
    fill_in 'position', :with => 'A1'
    click_button 'Submit'
    expect(page).to have_content("~~", :count => 95)
  end

end
