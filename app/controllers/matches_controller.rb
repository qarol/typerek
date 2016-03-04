# -*- encoding : utf-8 -*-
class MatchesController < ApplicationController
  before_filter :only_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @matchesFinished = Match.finished
    @matchesPending = Match.pending
    @matchesFuture = Match.future
    @answers = Answer.where(user_id: current_user.id)
  end

  def show
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new
    @comment = current_user.comments.build(match_id: @match.id)
    if @match.started?
      @users = User.active.order(:username)
      @answers = @match.answers(include: :user).order(:result)
    end
  end

  def edit
    @match = Match.find(params[:id])
    @answer = @match.answers.find_by_user_id(current_user.id) || Answer.new

    respond_to do |format|
      format.html { render 'edit' }
      format.js {}
    end
  end

  def set_type
    @match = Match.find(params[:id])
    if @match.started?
      flash[:alert] = 'Mecz już się rozpoczął. Twój typ nie został zmieniony.'
      redirect_to match_path(@match)
    else
      answer = Answer.find_by_user_id_and_match_id(current_user.id, @match.id) || @match.answers.build(user_id: current_user.id)
      if answer.update_attributes(result: params[:result])
        flash[:notice] = 'Zapisano typ'
      else
        flash[:alert] = 'Nie udało się zapisać typu. Spróbuj ponownie.'
      end
      redirect_to match_path(@match)
    end
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      flash[:notice] = 'Zapisano zmiany'
      respond_to do |format|
        format.html { redirect_to matches_path }
        format.js {}
      end
    else
      flash.now[:alert] = 'Wystąpił błąd'
      respond_to do |format|
        format.html { render action: 'edit' }
        format.js {}
      end
    end
  end

  def new
    @match = Match.new

    respond_to do |format|
      format.html { render 'new' }
      format.js {}
    end
  end

  def create
    @match = Match.new(params[:match])
    if @match.save
      flash[:notice] = 'Dodano nowy mecz'
      respond_to do |format|
        format.html { redirect_to matches_path }
        format.js {}
      end
    else
      flash.now[:alert] = 'Nie można dodać meczu. Wystąpił błąd'
      respond_to do |format|
        format.html { render action: 'new' }
        format.js {}
      end
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    flash[:notice] = 'Mecz został poprawnie usunięty.'
    redirect_to matches_path
  end
end
