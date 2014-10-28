class Quote < ActiveRecord::Base
  
  def self.get_all
    categories = %w[funny management sports life inspire love]
    categories.each do |category|
      puts "category is #{category}"
      search_url = "https://api.theysaidso.com/qod.json?category=#{category}"
      puts "url defined"
      response = HTTParty.get search_url
      puts "response gathered"
      Quote.create( tss_id:   response["contents"]["id"],
                    content:  response["contents"]["quote"],
                    author:   response["contents"]["author"],
                    category: response["contents"]["category"]
                  )
      puts "quote created"
    end
  end
end



  
