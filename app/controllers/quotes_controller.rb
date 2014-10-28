class QuotesController < ApplicationController
  
  def get_todays_7_quotes
    Quote.get().save()
    categories = %w[funny management sports life inspire love]
    categories.each do |category|
      Quote.get(category).save()
    end
  end
end