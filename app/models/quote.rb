class Quote < ActiveRecord::Base
  belongs_to :user
  
  validates :content, presence: true
  validates :source, presence: true

  def self.random
    cal_quote = self.grab_quote
    until cal_quote["source"] == "calvin" do 
      cal_quote = self.grab_quote
    end
    return cal_quote
  end

  private
    def self.grab_quote 
      source = "calvin"
      search_url = "http://www.iheartquotes.com/api/v1/random.json?source=#{source}"
      JSON.create_id = nil
      return HTTParty.get search_url
    end
end