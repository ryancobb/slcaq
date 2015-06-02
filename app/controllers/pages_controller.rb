class PagesController < ApplicationController

	def home

		o3 = Observation.where(parameterName: 'O3', created_at: Date.today-7..Date.today+2)

		o3_recent = o3.last

		@o3_status = o3_recent.categoryName
		@o3_aqi = o3_recent.aqi

		pm25 = Observation.where(parameterName: 'PM2.5', created_at: Date.today-7..Date.today+2)

		pm25_recent = pm25.last

		@pm25_status = pm25_recent.categoryName
		@pm25_aqi = pm25_recent.aqi

		#create arrays for chart
		@o3_arr = o3.collect { |o| [o.date_time, o.aqi, o.categoryName]}
		@pm25_arr = pm25.collect { |p| [p.date_time, p.aqi, p.categoryName]}
	end	

end
