# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    authorize! :manage, Notification
    @notifications = Notification.all
  end

  def display
    @notification = Notification.find(params[:id])
    authorize! :display, @notification
    if @notification.toggle!(:display)
      flash[:notice] = 'Zaktualizowano powiadomienie'
    else
      flash[:alert] = 'Nie udało się zaktualizować powiadomienia'
    end
    redirect_to :back
  end
end
