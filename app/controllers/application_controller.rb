class ApplicationController < ActionController::Base
  helper_method :current_user, :current_organization, :user_signed_in?

  before_action :authenticate_user!
  before_action :set_current_organization

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_session_path, alert: "Please sign in to continue."
    end
  end

  def current_organization
    @current_organization ||= current_user&.organizations&.find_by(id: session[:organization_id]) || current_user&.organizations&.first
  end

  def set_current_organization
    if user_signed_in? && current_organization.nil?
      redirect_to new_organization_path, notice: "Please create or join an organization."
    end
  end
end
