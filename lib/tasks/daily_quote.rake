desc "get a random quote and send it to all users"
task :daily_quote => :environment do 
  # source = Quote.random["source"]
  quote = Quote.random["quote"]
  # source_and_quote = source + quote
  User.all.each { |user| user.twilio(quote) } #using Heroku to do scheduled job
end
