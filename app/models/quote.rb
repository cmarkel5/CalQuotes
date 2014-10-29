class Quote < ActiveRecord::Base
  belongs_to :user
  # def self.get_all
  #   categories = %w[calvin forrestgump starwars]
  #   categories.each do |category|
  #     search_url = "http://www.iheartquotes.com/api/v1/random.json?source=#{category}"
  #     JSON.create_id = nil
  #     response = HTTParty.get search_url
  #     Quote.create( ihq_id:   response["link"],
  #                   content:  response["quote"],
  #                   source:   response["source"] )
  #   end
  # end
end



  
