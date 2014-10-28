class QuotesController < ApplicationController
 
  def one
    sources = %w[calvin forrestgump starwars]
    source = sources.sample
    search_url = "http://www.iheartquotes.com/api/v1/random.json?source=#{source}"
    JSON.create_id = nil
    response = HTTParty.get search_url
    @quote = response
  end
end