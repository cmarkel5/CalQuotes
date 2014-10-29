class QuotesController < ApplicationController
 
  def one
    sources = %w[calvin forrestgump starwars]
    source = sources.sample
    search_url = "http://www.iheartquotes.com/api/v1/random.json?source=#{source}"
    JSON.create_id = nil
    response = HTTParty.get search_url
    @quote = response
  end

  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      redirect_to current_user, notice: "You successfully saved a trail"
    else
      render 'new'
    end
  end

  private

    def quote_params
      params.require(:quote).permit(:content, :ihq_id, :source)
    end
end