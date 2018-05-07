class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
    json_response(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
       message: "Your quote has been updated successfully."
       }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    if @quote.destroy!(quote_params)
      render status: 200, json: {
       message: "Your quote has been deleted successfully."
       }
    end
  end

  private
  def quote_params
    params.permit(:author, :content)
  end
end
