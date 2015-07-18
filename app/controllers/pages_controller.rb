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

		@o3CSSClass = self.classConversion(@o3_status)

		pm25 = Observation.where(parameterName: 'PM2.5').last

		@pm25_status = pm25.categoryName
		@pm25_aqi = pm25.aqi

		@pm25CSSClass = self.classConversion(@pm25_status)

	end	

	def api
		observations = Observation.where(created_at: Date.today-7..Date.today+2)

		observations = observations.map { |obs| 
			{
				:dt => obs.date_time,
				obs.parameterName.to_sym => obs.aqi,
				:status => obs.categoryName
			}
		}

		@observations = observations.group_by {|obs| obs[:dt]}.map{|_, hs| hs.reduce(:merge)}

		render json: @observations
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
