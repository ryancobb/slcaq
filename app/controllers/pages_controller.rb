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

		o3 = Observation.where(parameterName: 'O3').last

		@o3_status = o3.categoryName
		@o3_aqi = o3.aqi
		@o3_observed = o3.date_time

		@o3CSSClass = classConversion(@o3_status)

		pm25 = Observation.where(parameterName: 'PM2.5').last

		@pm25_status = pm25.categoryName
		@pm25_aqi = pm25.aqi
		@pm25_observed = pm25.date_time

		@pm25CSSClass = classConversion(@pm25_status)

	end

	def classConversion(categoryName)
		case categoryName
			when 'Good'
				cssClass = 'good'
			when 'Moderate'
				cssClass = 'moderate'
			when 'Unhealthy for Sensitive Groups'
				cssClass = 'UFSG'
			when 'Unhealthy'
				cssClass = 'unhealthy'
			when 'Very Unhealthy'
				cssClass = 'veryunhealthy'
			when 'Hazardous'
				cssClass = 'hazardous'
		end
	end

end
