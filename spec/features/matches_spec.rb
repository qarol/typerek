# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Matches', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  feature 'when user opens future match' do
    let(:match) { create(:match, :start_in_future) }

    scenario 'can set bet' do
      visit "/matches/#{match.id}"
      within('#my-bet') do
        expect(page).to have_link(match.win_a.to_s)
        expect(page).to have_link(match.win_b.to_s)
        expect(page).to have_link(match.tie.to_s)
        expect(page).to have_link(match.win_tie_a.to_s)
        expect(page).to have_link(match.win_tie_b.to_s)
        expect(page).to have_link(match.not_tie.to_s)

        click_link(match.win_tie_a)
      end

      answer = Answer.find_by(match: match, user: user)
      expect(answer.result).to eq('win_tie_a')
    end

    scenario 'can see own bet'

    scenario 'cannot see others bets' do
      visit "/matches/#{match.id}"
      expect(page).not_to have_selector('#others-bets')
    end

    scenario 'can comment'
  end

  feature 'when user opens present match' do
    let(:match) { create(:match, :start_in_past, :without_results) }

    scenario 'cannot set bet' do
      visit "/matches/#{match.id}"
      within('#my-bet') do
        expect(page).not_to have_link(match.win_a.to_s)
        expect(page).not_to have_link(match.win_b.to_s)
        expect(page).not_to have_link(match.tie.to_s)
        expect(page).not_to have_link(match.win_tie_a.to_s)
        expect(page).not_to have_link(match.win_tie_b.to_s)
        expect(page).not_to have_link(match.not_tie.to_s)
      end
    end

    scenario 'can see own bet'

    scenario 'can see others bets' do
      visit "/matches/#{match.id}"
      expect(page).to have_selector('#others-bets')
    end

    scenario 'can comment'
  end

  feature 'when user opens past match' do
    let(:match) { create(:match, :start_in_past, :winner_a) }

    scenario 'cannot set bet' do
      visit "/matches/#{match.id}"
      within('#my-bet') do
        expect(page).not_to have_link(match.win_a.to_s)
        expect(page).not_to have_link(match.win_b.to_s)
        expect(page).not_to have_link(match.tie.to_s)
        expect(page).not_to have_link(match.win_tie_a.to_s)
        expect(page).not_to have_link(match.win_tie_b.to_s)
        expect(page).not_to have_link(match.not_tie.to_s)
      end
    end

    scenario 'can see own bet'

    scenario 'can see others bets' do
      visit "/matches/#{match.id}"
      expect(page).to have_selector('#others-bets')
    end

    scenario 'can comment'
  end
end
