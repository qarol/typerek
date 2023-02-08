# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Typerek::MakeBet::Handler do
  describe "#call" do
    let(:match) { create(:match, start: 2.days.from_now) }
    let(:user) { create(:user) }

    context "when match is not started and user exists" do
      it "creates new answer" do
        described_class.new(match_id: match.id, user_id: user.id, result: :win_a).call

        expect(match.answers.count).to eq(1)
      end

      it "updates existing answer" do
        answer = create(:answer, match: match, user: user, result: :tie)
        described_class.new(match_id: match.id, user_id: user.id, result: :win_a).call

        expect(answer.reload.result).to eq('win_a')
      end
    end

    context "when result is invalid" do
      it "raises error" do
        expect {
          described_class.new(match_id: match.id, user_id: user.id, result: :unknown).call
        }.to raise_error(Typerek::Error)
      end
    end

    context "when match is started" do
      it "raises error" do
        match.update(start: Time.current)

        expect {
          described_class.new(match_id: match.id, user_id: user.id, result: :win_a).call
        }.to raise_error(Typerek::MatchAlreadyStartedError)
      end
    end

    context "when match is not found" do
      it "raises error" do
        expect {
          described_class.new(match_id: match.id + 1, user_id: user.id, result: :win_a).call
        }.to raise_error(Typerek::MatchNotFoundError)
      end
    end

    context "when user is not found" do
      it "raises error" do
        expect {
          described_class.new(match_id: match.id, user_id: user.id + 1, result: :win_a).call
        }.to raise_error(Typerek::UserNotFoundError)
      end
    end
  end
end
