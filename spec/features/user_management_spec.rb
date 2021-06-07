# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User management', type: :feature do
  feature 'User' do
    let(:user) { create(:user) }

    background do
      login_as(user, scope: :user)
    end

    scenario "cannot see 'Zaproszenia' link" do
      visit '/'
      expect(page).not_to have_link('Zaproszenia')
    end
  end

  feature 'Admin' do
    let(:user) { create(:user, :admin) }

    background do
      login_as(user, scope: :user)
    end

    scenario 'Admin invites user' do
      visit '/'
      click_link 'Zaproszenia'
      expect(page).not_to have_content('custom_user')
      fill_in 'Login', with: 'custom_user'
      click_button 'Generuj zaproszenie'
      expect(page).to have_content('Utworzono konto, link aktywacyjny:')
      click_link 'Zaproszenia'
      expect(page).to have_content('custom_user')
    end
  end
end
