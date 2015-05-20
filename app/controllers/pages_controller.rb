class PagesController < ApplicationController

	def home

		response = HTTParty.get("http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=84111&distance=25&API_KEY=A25F119F-6CD4-4DBA-865A-8B00DB12459F")

		json = JSON.parse(response.body)
		@o3_aqi = json[0]["AQI"]
		@o3_status = json[0]["Category"]["Name"]

		#@pm25_aqi = json[1]["AQI"]
		#@pm25_status = json[1]["Category"]["Name"]

		time = Time.new + (60*60*24)
		timef = time.strftime("%Y-%m-%d")

		response = HTTParty.get("http://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode=84111&date=" + timef + "&distance=25&API_KEY=A25F119F-6CD4-4DBA-865A-8B00DB12459F")
		json = JSON.parse(response.body)
		@tomorrow_o3_aqi = json[0]["AQI"]
		@tomorrow_o3_status = json[0]["Category"]["Name"]

		@tomorrow_pm25_aqi = json[1]["AQI"]
		@tomorrow_pm25_status = json[1]["Category"]["Name"]

	end	

end
