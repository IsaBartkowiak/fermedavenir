module ApplicationHelper
	def get_cart_total(portions)
		price = 0
		portions.each do |p|
		  price += p.price
		end 
		price
	end
end
