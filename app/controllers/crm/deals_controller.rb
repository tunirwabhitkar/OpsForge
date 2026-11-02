module Crm
  class DealsController < ApplicationController
    before_action :set_deal, only: [:show, :edit, :update, :destroy]

    def index
      @deals = current_organization.deals.order(created_at: :desc)
    end

    def pipeline
      @deals = current_organization.deals
    end

    def show
    end

    def new
      @deal = current_organization.deals.new
    end

    def create
      @deal = current_organization.deals.new(deal_params)
      if @deal.save
        redirect_to crm_deal_path(@deal), notice: "Deal created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @deal.update(deal_params)
        redirect_to crm_deal_path(@deal), notice: "Deal updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @deal.destroy
      redirect_to crm_deals_path, notice: "Deal deleted successfully."
    end

    private

    def set_deal
      @deal = current_organization.deals.find(params[:id])
    end

    def deal_params
      params.require(:deal).permit(:name, :company_id, :stage, :amount, :close_date, :assigned_to_id)
    end
  end
end
