
class RankingsController < ApplicationController
  def show
    @users = User.all.sort{|a,b| b.points <=> a.points}
  end
end
