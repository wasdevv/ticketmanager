class TicketsController < ApplicationController

    def index
        @tickets = Ticket.all
    end

    def create
        ticket = Ticket.new(ticket_params)
        if ticket.save
            render json: ticket, status: :created
        else
            render :new
        end
    end

    def new
        @ticket = Ticket.new(status: "Open")
    end

    private

    def ticket_params
        params.require(:ticket).permit(:title, :description, :status)
    end
end
