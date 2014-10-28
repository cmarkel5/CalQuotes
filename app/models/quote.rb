class Quote < ActiveRecord::Base
  def self.get(category = null)
    if category != null
      search_url = "https://api.theysaidso.com/qod.json?category=#{category}"
    else
      search_url = "https://api.theysaidso.com/qod.json"
    end
    
    response = HTTParty.get search_url

    id = response["contents"]["id"]
    quote = response["contents"]["quote"]
    author = response["contents"]["author"]
    length = response["contents"]["length"]
    tags = response["contents"]["tags"]
    category = response["contents"]["category"]
    response
  end
end
