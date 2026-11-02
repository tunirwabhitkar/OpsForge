class SearchController < ApplicationController
  def index
    @query = params[:q]
    if @query.present?
      @companies = current_organization.companies.where("name ILIKE ?", "%#{@query}%")
      @deals = current_organization.deals.where("name ILIKE ?", "%#{@query}%")
      @tickets = current_organization.tickets.where("subject ILIKE ?", "%#{@query}%")
      @articles = current_organization.articles.where("title ILIKE ?", "%#{@query}%")
    else
      @companies = []
      @deals = []
      @tickets = []
      @articles = []
    end
  end
end
