task :qod => :environment do 
  Quote.get_all
end
