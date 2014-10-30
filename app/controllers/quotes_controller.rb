class QuotesController < ApplicationController

  def random
    @quote = Quote.random
  end

  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      redirect_to current_user, notice: "You successfully saved a quote"
    else
      render 'new'
    end
  end

  private

    def quote_params
      params.require(:quote).permit(:content, :ihq_id, :source)
    end
end