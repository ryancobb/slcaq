# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery -> 
	Morris.Line
		element: 'aqi_chart'
		data: $('#aqi_chart').data('aqi')
		xkey: 'dt'
		ykeys: ['O3','PM2.5']
		labels: ['O3','PM2.5']
		dateFormat: (date) ->
			d = new Date(date)
			hours = ((d.getHours() + 11) % 12 + 1 )
			if d.getHours() >= 12
				suffix = "PM"
			else
				suffix = "AM"

			d.getMonth(date) + 1 + '/' + d.getDate(date) + '/' + d.getFullYear() + ' ' + hours + suffix
		xLabelFormat: (date) ->
			d = new Date(date)
			d.getMonth(date) + 1 + '/' + d.getDate(date) + '/' + d.getFullYear()
