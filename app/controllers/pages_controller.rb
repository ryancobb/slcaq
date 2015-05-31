class PagesController < ApplicationController

	def home

		#updateAirNow

		o3 = Observation.where(parameterName: 'O3').order(:updated_at).last

		@o3_status = o3.categoryName
		@o3_aqi = o3.aqi

		pm25 = Observation.where(parameterName: 'PM2.5').order(:updated_at).last

		@pm25_status = pm25.categoryName
		@pm25_aqi = pm25.aqi

	end	

end
