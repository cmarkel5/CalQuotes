task :daily_quote => :environment do 
  desc "get a random quote and send it to all users"
  source = Quote.random["source"]
  quote = Quote.random["quote"]
  source_and_quote = source + quote
  User.all.each { |user| user.twilio(source_and_quote) } #using Heroku to do scheduled job
end
