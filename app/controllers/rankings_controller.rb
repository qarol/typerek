class RankingsController < ApplicationController
  def show
    @users = User.active.sort { |a, b| b.points <=> a.points }
  end
end
