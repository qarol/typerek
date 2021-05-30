# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  describe '.finished' do
    let!(:past_match) { create(:match, :start_in_past, :winner_a) }
    let!(:current_match) { create(:match, :start_in_past, :without_results) }
    let!(:future_match) { create(:match, :start_in_future, :without_results) }

    it 'returns list of finished matches' do
      expect(described_class.finished).to match_array(past_match)
    end
  end

  describe '.pending' do
    let!(:past_match) { create(:match, :start_in_past, :winner_a) }
    let!(:current_match) { create(:match, :start_in_past, :without_results) }
    let!(:future_match) { create(:match, :start_in_future, :without_results) }

    it 'returns list of finished matches' do
      expect(described_class.pending).to match_array(current_match)
    end
  end

  describe '.future' do
    let!(:past_match) { create(:match, :start_in_past, :winner_a) }
    let!(:current_match) { create(:match, :start_in_past, :without_results) }
    let!(:future_match) { create(:match, :start_in_future, :without_results) }

    it 'returns list of finished matches' do
      expect(described_class.future).to match_array(future_match)
    end
  end

  describe '#started?' do
    context 'when there is no start time defined' do
      subject(:match) { described_class.new(start: nil) }

      it { expect(match.started?).to eq(false) }
    end

    context 'when there is start time defined in future' do
      subject(:match) { described_class.new(start: 1.minute.from_now) }

      it { expect(match.started?).to eq(false) }
    end

    context 'when there is start time defined in past' do
      subject(:match) { described_class.new(start: 1.minute.ago) }

      it { expect(match.started?).to eq(true) }
    end
  end

  describe '#finished?' do
    context 'when there is no start time defined' do
      subject(:match) { described_class.new(start: nil) }

      it { expect(match.finished?).to eq(false) }
    end

    context 'when there is start time defined in future' do
      subject(:match) { described_class.new(start: 1.minute.from_now) }

      it { expect(match.finished?).to eq(false) }
    end

    context 'when there is start time defined in past and has defined both results' do
      subject(:match) { described_class.new(start: 1.minute.ago, result_a: 0, result_b: 0) }

      it { expect(match.finished?).to eq(true) }
    end
  end

  describe '#current?' do
    context 'when there is no start time defined' do
      subject(:match) { described_class.new(start: nil) }

      it { expect(match.current?).to eq(false) }
    end

    context 'when there is start time defined in future' do
      subject(:match) { described_class.new(start: 1.minute.from_now) }

      it { expect(match.current?).to eq(false) }
    end

    context 'when there is start time defined in past and has no defined both results' do
      subject(:match) { described_class.new(start: 1.minute.ago, result_a: nil, result_b: nil) }

      it { expect(match.current?).to eq(true) }
    end

    context 'when there is start time defined in past and has defined both results' do
      subject(:match) { described_class.new(start: 1.minute.ago, result_a: 0, result_b: 0) }

      it { expect(match.current?).to eq(false) }
    end
  end

  describe '#winning_list' do
    context 'when there is no result_a' do
      subject(:match) { described_class.new(result_a: nil) }

      it { expect(match.winning_list).to eq([]) }
    end

    context 'when there is no result_b' do
      subject(:match) { described_class.new(result_b: nil) }

      it { expect(match.winning_list).to eq([]) }
    end

    context 'when there is result_a > result_b' do
      subject(:match) { described_class.new(result_a: 1, result_b: 0) }

      it { expect(match.winning_list).to eq(%w[win_a win_tie_a not_tie]) }
    end

    context 'when there is result_a < result_b' do
      subject(:match) { described_class.new(result_a: 0, result_b: 1) }

      it { expect(match.winning_list).to eq(%w[win_b win_tie_b not_tie]) }
    end

    context 'when there is result_a = result_b' do
      subject(:match) { described_class.new(result_a: 0, result_b: 0) }

      it { expect(match.winning_list).to eq(%w[tie win_tie_a win_tie_b]) }
    end
  end
end
