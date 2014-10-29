class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authorize

  protect_from_forgery with: :exception

  protected

  def authorize
    return if current_user.can?(params[:controller], params[:action])
    redirect_to root_url, notice: 'You no have permissions to do this.'
  end
end
