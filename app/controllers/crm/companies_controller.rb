module Crm
  class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    def index
      @companies = current_organization.companies.order(created_at: :desc)
    end

    def show
    end

    def new
      @company = current_organization.companies.new
    end

    def create
      @company = current_organization.companies.new(company_params)
      if @company.save
        redirect_to crm_company_path(@company), notice: "Company created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @company.update(company_params)
        redirect_to crm_company_path(@company), notice: "Company updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @company.destroy
      redirect_to crm_companies_path, notice: "Company deleted successfully."
    end

    private

    def set_company
      @company = current_organization.companies.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :domain, :industry, :status, :assigned_to_id)
    end
  end
end
