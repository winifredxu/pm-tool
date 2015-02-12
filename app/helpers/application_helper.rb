module ApplicationHelper

	def standard_date(date)
			date.strftime("%d %B %Y") if date
	end
end
