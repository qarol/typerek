# -*- encoding : utf-8 -*-
class MatchesController < ApplicationController
  before_filter :only_admin, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @matchesFinished = Match.finished
    @matchesPending = Match.pending
    @matchesFuture = Match.future
    @answers = Answer.where(:user_id => current_user.id)
  end

  def show
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new
    @comment = current_user.comments.build(:match_id => @match.id)
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
      flash[:alert] = "Mecz już się rozpoczął. Twój typ nie został zmieniony."
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
      flash.now[:alert] = "Wystąpił błąd"
      render :action => "edit"
    end
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(params[:match])
    if @match.save
      flash[:notice] = "Dodano nowy mecz"
      redirect_to matches_path
    else
      flash.now[:alert] = "Nie można dodać meczu. Wystąpił błąd"
      render :action => "new"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    flash[:notice] = "Mecz został poprawnie usunięty."
    redirect_to matches_path
  end
end
