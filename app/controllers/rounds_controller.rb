class RoundsController < ApplicationController
  def index
    redirect_to round_path(Round.current)
  end

  def show
    @round = Round.find(params[:id])
    @matchesFinished = @round.matches.finished
    @matchesPending = @round.matches.pending
    @matchesFuture = @round.matches.future
    @answers = Answer.where(:user_id => current_user.id)
    render 'matches/index'
  end
end
