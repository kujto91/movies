require 'rails_helper'

feature 'Manage movies' do
  context 'with a successfull api call' do
    scenario 'visit movies index page' do
      visit root_path

      expect(page).to be_present
      expect(page).to have_css '#tt2975590'
      expect(page).to have_css '#tt2015381'
      expect(page).to have_css '#tt1856101'
    end

    scenario 'visit movie show page' do
      visit root_path
      find('#tt2975590').click

      expect(page).to be_present
      expect(page).to have_content 'Batman v Superman: Dawn of Justice'
    end
  end
end
