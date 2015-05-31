class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def updateAirNow
  		response = HTTParty.get("http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=84111&distance=25&API_KEY=A25F119F-6CD4-4DBA-865A-8B00DB12459F")

		json = JSON.parse(response.body)
		json.each do |j|
			Observation.create(dateObserved: j["DateObserved"], hourObserved: j["HourObserved"], localTimeZone: j["LocalTimeZone"],
				reportingArea: j["ReportingArea"], stateCode: j["StateCode"], latitude: j["Latitude"], longitude: j["Longitude"],
				parameterName: j["ParameterName"], aqi: j["AQI"], categoryNumber: j["Category"]["Number"], categoryName: j["Category"]["Name"])
		end
	end

end
