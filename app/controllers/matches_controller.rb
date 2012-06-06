# -*- encoding : utf-8 -*-
class MatchesController < ApplicationController
  before_filter :only_admin, :only => [:edit, :update]

  def index
    @matchesFinished = Match.finished
    @matchesPending = Match.pending
    @matchesFuture = Match.future
    @answers = Answer.where(:user_id => current_user.id)
  end

  def show
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new
    if @match.started?
      @answers = @match.answers(:include => :user).order(:result)
    end
  end

  def edit
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new
  end

  def set_type
    @match = Match.find(params[:id])
    if @match.started?
      redirect_to match_path(@match)
    else
      answer = Answer.find_by_user_id_and_match_id(current_user.id, @match.id) || @match.answers.build(:user_id => current_user.id)
      if (answer.update_attributes(:result => params[:result]))
        flash[:notice] = "Zapisano typ"
      else
        flash[:alert] = "Nie udało się zapisać typu. Spróbuj ponownie."
      end
      redirect_to match_path(@match)
    end
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      flash[:notice] = "Zapisano zmiany"
      redirect_to matches_path
    else
      flash[:alert] = "Wystąpił błąd"
      render :action => "edit"
    end
  end

  private
  def only_admin
    redirect_to matches_path unless current_user.admin?
  end
end
