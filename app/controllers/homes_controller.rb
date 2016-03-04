class HomesController < ApplicationController
  def show
    @comments = Comment.order(created_at: :desc).limit(6)
  end
end
