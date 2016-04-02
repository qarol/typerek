class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
  end

  def display
    @notification = Notification.find(params[:id])
    if @notification.toggle!(:display)
      flash[:notice] = 'Zaktualizowano powiadomienie'
    else
      flash[:alert] = 'Nie udało się zaktualizować powiadomienia'
    end
    redirect_to :back
  end
end
