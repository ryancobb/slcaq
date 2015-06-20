class PagesController < ApplicationController

	def home

		observations = Observation.where(created_at: Date.today-7..Date.today+2)

		observations = observations.map { |obs| 
			{
				:dt => obs.date_time,
				obs.parameterName.to_sym => obs.aqi,
				:status => obs.categoryName
			}
		}

		@observations = observations.group_by {|obs| obs[:dt]}.map{|_, hs| hs.reduce(:merge)}

		@o3 = Observation.where(parameterName: 'O3', created_at: Date.today-7..Date.today+2)

		o3_recent = @o3.last

		@o3_status = o3_recent.categoryName
		@o3_aqi = o3_recent.aqi

		@pm25 = Observation.where(parameterName: 'PM2.5', created_at: Date.today-7..Date.today+2)

		pm25_recent = @pm25.last

		@pm25_status = pm25_recent.categoryName
		@pm25_aqi = pm25_recent.aqi

	end	

end
