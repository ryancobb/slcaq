desc "This task is called by the Heroku scheduler add-on"
task :scrape_airnow => :environment do
	updateAirNow
end