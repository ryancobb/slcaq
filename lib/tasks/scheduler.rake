desc "This task is called by the Heroku scheduler add-on"
task :scrape_airnow => :environment do

  		response = HTTParty.get("http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=84111&distance=25&API_KEY=A25F119F-6CD4-4DBA-865A-8B00DB12459F")

		json = JSON.parse(response.body)
		json.each do |j|
			Observation.create(dateObserved: j["DateObserved"], hourObserved: j["HourObserved"], localTimeZone: j["LocalTimeZone"],
				reportingArea: j["ReportingArea"], stateCode: j["StateCode"], latitude: j["Latitude"], longitude: j["Longitude"],
				parameterName: j["ParameterName"], aqi: j["AQI"], categoryNumber: j["Category"]["Number"], categoryName: j["Category"]["Name"])
		end

end