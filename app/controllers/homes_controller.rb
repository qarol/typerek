class HomesController < ApplicationController
  def show
    @comments = Comment.order('created_at DESC').limit(6)
  end
end
