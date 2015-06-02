class Observation < ActiveRecord::Base

	def date_time
		d = self.dateObserved
		t = self.hourObserved
		dt = DateTime.new(d.year, d.month, d.day, t, 0, 0, self.localTimeZone)
	end

end
