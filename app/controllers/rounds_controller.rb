class RoundsController < ApplicationController
  def index
    redirect_to round_path(Round.current)
  end

  def show
    @round = Round.find(params[:id])
    redirect_to round_matches_path(@round)
  end
end
