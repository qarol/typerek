# frozen_string_literal: true

# Kontroler obsluguje podglad rankingu uzytkownikow
class RankingsController < ApplicationController
  def show
    @users = User.includes(answers: :match).active.sort do |a, b|
      points_comparison = b.points <=> a.points
      points_comparison.zero? ? a.username <=> b.username : points_comparison
    end
    @points = @users.map(&:points)
  end
end
