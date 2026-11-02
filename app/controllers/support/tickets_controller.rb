module Support
  class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
      @tickets = current_organization.tickets.order(created_at: :desc)
    end

    def show
    end

    def new
      @ticket = current_organization.tickets.new
    end

    def create
      @ticket = current_organization.tickets.new(ticket_params)
      @ticket.requester = current_user
      if @ticket.save
        redirect_to support_ticket_path(@ticket), notice: "Ticket created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @ticket.update(ticket_params)
        redirect_to support_ticket_path(@ticket), notice: "Ticket updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @ticket.destroy
      redirect_to support_tickets_path, notice: "Ticket deleted successfully."
    end

    private

    def set_ticket
      @ticket = current_organization.tickets.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:subject, :category, :priority, :status, :assignee_id)
    end
  end
end
