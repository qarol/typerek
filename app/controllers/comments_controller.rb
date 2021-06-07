# frozen_string_literal: true

# Kontroler obsluguje komentarze wystawiane przez uzytkownika do meczu
class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    authorize! :create, @comment
    if @comment.save
      flash[:notice] = 'Dodano komentarz'
    else
      flash[:alert] = 'Wystąpił błąd przy dodawaniu komentarza'
    end
    redirect_to match_path(@comment.match)
  end

  private

  def comment_params
    params.require(:comment).permit(:match_id, :content)
  end
end
