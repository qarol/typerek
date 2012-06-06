# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    #@comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Dodano komentarz"
    else
      flash[:alert] = "Wystąpił błąd przy dodawaniu komentarza"
    end
    redirect_to match_path(@comment.match)
  end
end
