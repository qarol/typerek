# Kontroler obsluguje podglad rankingu uzytkownikow
class RankingsController < ApplicationController
  def show
    @users = User.active.sort { |a, b| b.points <=> a.points }
    @points = @users.map(&:points)
  end
end
