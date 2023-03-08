# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Typerek::UpdateMatch::Handler do
  describe '#call' do
    let(:match) { create(:match, start: 2.days.from_now) }

    context 'when match does not exist' do
      it 'raises error' do
        expect do
          described_class.new(match_id: match.id + 1, attributes: {}).call
        end.to raise_error(Typerek::MatchNotFoundError)
      end
    end

    context 'when match exists' do
      it 'updates team names' do
        described_class.new(match_id: match.id, attributes: { team_a: 'team A', team_b: 'team B' }).call

        expect(match.reload).to have_attributes(team_a: 'team A', team_b: 'team B')
      end

      it 'updates odds' do
        described_class.new(
          match_id: match.id,
          attributes: { win_a: 1.5, win_b: 2.5, tie: 3.5, win_tie_a: 4.5, win_tie_b: 5.5, not_tie: 6.5 }
        ).call

        expect(match.reload).to have_attributes(
          win_a: 1.5,
          win_b: 2.5,
          tie: 3.5,
          win_tie_a: 4.5,
          win_tie_b: 5.5,
          not_tie: 6.5
        )
      end
    end
  end
end
