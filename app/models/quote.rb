class Quote < ActiveRecord::Base
  belongs_to :user
  
  def self.random
    sources = %w[calvin forrestgump starwars]
    source = sources.sample
    search_url = "http://www.iheartquotes.com/api/v1/random.json?source=#{source}"
    JSON.create_id = nil
    HTTParty.get search_url
  end
end



  
