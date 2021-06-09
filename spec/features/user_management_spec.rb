# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User management', type: :feature do
  feature 'User' do
    background do
      user = create(:user)
      login_as(user, scope: :user)
    end

    scenario "doesn't have access to invitations section" do
      visit '/'
      expect(page).not_to have_link('Zaproszenia')
    end
  end

  feature 'Admin' do
    background do
      user = create(:user, :admin)
      login_as(user, scope: :user)
    end

    scenario 'has to type proper username of invited user' do
      visit '/'
      click_link 'Zaproszenia'
      fill_in 'Login', with: ''
      click_button 'Generuj zaproszenie'
      expect(page).to have_content('nie może być puste')
    end

    scenario 'can invite other person using proper username' do
      visit '/'
      click_link 'Zaproszenia'
      within('#list-of-users') do
        expect(page).not_to have_content('custom_user')
      end
      fill_in 'Login', with: 'custom_user'
      click_button 'Generuj zaproszenie'
      expect(page).to have_content('Utworzono konto, link aktywacyjny:')
      click_link 'Zaproszenia'
      within('#list-of-users') do
        expect(page).to have_content('custom_user')
      end
    end

    scenario 'can remove any person' do
      visit '/'
    end
  end
end
