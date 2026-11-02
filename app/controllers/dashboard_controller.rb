class DashboardController < ApplicationController
  def index
    return unless current_organization

    @companies_count = current_organization.companies.count
    @deals_count = current_organization.deals.count
    @open_deals_value = current_organization.deals.where.not(stage: %w[closed_won closed_lost]).sum(:amount)
    @open_tickets_count = current_organization.tickets.where.not(status: %w[resolved closed]).count
    @candidates_count = current_organization.candidates.count
    @articles_count = current_organization.articles.count
  end
end
