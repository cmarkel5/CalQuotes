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

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to current_user
  end

  private

    def quote_params
      params.require(:quote).permit(:content, :ihq_id, :source)
    end
end