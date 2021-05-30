# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe '#points' do
    let(:match_a) { create(:match, :start_in_past, :winner_a) }
    let(:match_b) { create(:match, :start_in_past, :winner_a) }
    let(:match_c) { create(:match, :start_in_past, :winner_a) }
    let(:match_d) { create(:match, :start_in_past, :winner_a) }

    let(:match_e) { create(:match, :start_in_past, :winner_b) }
    let(:match_f) { create(:match, :start_in_past, :winner_b) }
    let(:match_g) { create(:match, :start_in_past, :winner_b) }
    let(:match_h) { create(:match, :start_in_past, :winner_b) }

    let(:match_i) { create(:match, :start_in_past, :tie) }
    let(:match_j) { create(:match, :start_in_past, :tie) }
    let(:match_k) { create(:match, :start_in_past, :tie) }
    let(:match_l) { create(:match, :start_in_past, :tie) }

    let(:match_m) { create(:match, :start_in_past, :without_results) }
    let(:match_n) { create(:match, :start_in_future, :without_results) }

    before do
      create(:answer, user: user, match: match_a, result: :win_a)
      create(:answer, user: user, match: match_b, result: :win_tie_a)
      create(:answer, user: user, match: match_c, result: :not_tie)
      create(:answer, user: user, match: match_d, result: :win_b)

      create(:answer, user: user, match: match_e, result: :win_b)
      create(:answer, user: user, match: match_f, result: :win_tie_b)
      create(:answer, user: user, match: match_g, result: :not_tie)
      create(:answer, user: user, match: match_h, result: :win_a)

      create(:answer, user: user, match: match_i, result: :tie)
      create(:answer, user: user, match: match_j, result: :win_tie_a)
      create(:answer, user: user, match: match_k, result: :win_tie_b)
      create(:answer, user: user, match: match_l, result: :win_a)

      create(:answer, user: user, match: match_m, result: :win_a)
      create(:answer, user: user, match: match_n, result: :win_a)
    end

    it 'calculates properly points' do
      expect(user.points).to eq(
        (
          match_a.win_a + match_b.win_tie_a + match_c.not_tie +
          match_e.win_b + match_f.win_tie_b + match_g.not_tie +
          match_i.tie + match_j.win_tie_a + match_k.win_tie_b
        ).round(2)
      )
    end
  end

  describe '#email_required?' do
    it { expect(user.email_required?).to eq(false) }
  end

  describe '#email_changed?' do
    it { expect(user.email_changed?).to eq(false) }
  end

  describe '#fin!' do
    before { user.fin! }

    it 'updates fin attribute to true' do
      expect(user.reload.fin).to eq(true)
    end
  end

  describe '#fin_revoke!' do
    before { user.fin_revoke! }

    it 'updates fin attribute to true' do
      expect(user.reload.fin).to eq(false)
    end
  end
end
