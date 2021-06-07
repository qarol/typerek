# frozen_string_literal: true

# Strona glowna dostepna po zalogowaniu
class HomesController < ApplicationController
  def show
    @comments = Comment.accessible_by(current_ability).order(created_at: :desc).limit(6)
  end
end
