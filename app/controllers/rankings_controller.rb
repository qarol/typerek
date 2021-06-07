# frozen_string_literal: true

# Kontroler obsluguje podglad rankingu uzytkownikow
class RankingsController < ApplicationController
  def show
    @users = User.includes(answers: :match).active.sort { |a, b| b.points <=> a.points }
    @points = @users.map(&:points)
  end
end
