class MatchesController < ApplicationController
  def index
    @matches_finished = Match.finished.includes(:answers).accessible_by(current_ability)
    @matches_pending = Match.pending.includes(:answers).accessible_by(current_ability)
    @matches_future = Match.future.includes(:answers).accessible_by(current_ability)
    @answers = current_user.answers
  end

  def show
    @match = Match.includes(:answers).find(params[:id])
    authorize! :read, @match
    if @match.started?
      @users = User.active.order(:username)
      @answers = @match.answers.group_by(&:user_id)
    end
    @comment = current_user.comments.build(match_id: @match.id)
    @answer = @match.answers.find_or_initialize_by(user_id: current_user.id)
  end

  def edit
    @match = Match.find(params[:id])
    authorize! :update, @match
    @answer = @match.answers.find_or_initialize_by(user_id: current_user.id)

    respond_to do |format|
      format.html { render 'edit' }
      format.js {}
    end
  end

  def set_type
    @match = Match.find(params[:id])
    if @match.started?
      flash[:alert] = 'Mecz już się rozpoczął. Twój typ nie został zmieniony.'
    else
      answer = @match.answers.find_or_initialize_by(user_id: current_user.id)
      if answer.update_attributes(result: params[:result])
        flash[:notice] = 'Zapisano typ'
      else
        flash[:alert] = 'Nie udało się zapisać typu. Spróbuj ponownie.'
      end
    end
    redirect_to match_path(@match)
  end

  def update
    @match = Match.find(params[:id])
    authorize! :update, @match
    if @match.update_attributes(match_params)
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

  private

  def match_params
    params.require(:match).permit(:team_a, :team_b, :win_a, :tie, :win_b, :win_tie_a, :win_tie_b, :not_tie, :start,
                                  :result_a, :result_b)
  end
end
