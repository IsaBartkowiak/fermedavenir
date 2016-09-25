module ApplicationHelper
	# FIXME put that in model cart!!!
	def get_cart_total(portions)
		price = 0
		portions.each do |p|
		  price += p.price
		end 
		price.round(2)
	end

	def is_active?(controller)
		controller == params[:controller]
	end

	def is_current_week?(a_week)
		Date.today.cweek == a_week
	end

	def help(title, text)
		# TODO
	end
end