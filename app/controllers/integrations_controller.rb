class IntegrationsController < ApplicationController
  def index
    @integrations = current_organization.integrations
  end

  def create
    integration = current_organization.integrations.find_or_initialize_by(provider: params[:provider])
    integration.status = "active"
    if integration.save
      redirect_to integrations_path, notice: "Integration activated successfully."
    else
      redirect_to integrations_path, alert: "Failed to activate integration."
    end
  end

  def destroy
    integration = current_organization.integrations.find(params[:id])
    integration.destroy
    redirect_to integrations_path, notice: "Integration removed successfully."
  end
end
