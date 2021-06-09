# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Session', type: :feature do
  feature 'When user exists and is not signed in' do
    background do
      create(:user, username: 'user', password: 'password')
    end

    scenario 'User signs in correctly' do
      visit '/'
      expect(page).not_to have_content('Cześć! Strona powstała by w gronie przyjaciół')
      fill_in 'Login', with: 'user'
      fill_in 'Hasło', with: 'password'
      click_button 'Zaloguj się'
      expect(page).to have_content('Cześć! Strona powstała by w gronie przyjaciół')
    end
  end

  feature 'When user exists and is already signed in' do
    background do
      user = create(:user, username: 'user', password: 'password')
      login_as(user, scope: :user)
    end

    scenario 'User signs out correctly' do
      visit '/'
      expect(page).to have_content('Cześć! Strona powstała by w gronie przyjaciół')
      click_link 'user - wyloguj się'
      expect(page).not_to have_content('Cześć! Strona powstała by w gronie przyjaciół')
    end
  end
end
