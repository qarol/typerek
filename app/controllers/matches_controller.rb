
class MatchesController < ApplicationController
  def index
    @matches = Match.order(:start)
  end

  def show
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new
    @answers = @match.answers(:include => :user).order(:result)
    #redirect_to :action => "index" if @match.start < DateTime.now
  end

  def edit
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new
    redirect_to :action => "index" if @match.start > DateTime.now
  end

  def set_type
    @match = Match.find(params[:id])
    redirect_to :action => "edit" if @match.start > DateTime.now
    answer = Answer.find_by_user_id_and_match_id(current_user.id, @match.id) || @match.answers.build(:user_id => current_user.id)
    answer.update_attributes(:result => params[:result])
    redirect_to :action => "edit"
  end
end
