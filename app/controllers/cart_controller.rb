class CartController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def add
		if Cart.find_by(project_id: params[:id])
			@cart = Cart.find_by(project_id: params[:id])
			@cart.update(quantity: @cart.quantity + 1)
		else
			Cart.create(user: current_user, project_id: params[:id], quantity: 1)
		end
		redirect_to :action => :index
	end

	def index
		@cart = Cart.where(user: current_user)
	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		redirect_to cart_index_path
	end
	# def add
	# 	id = params[:id]
	# 	if session[:cart] then
	# 		cart = session[:cart]
	# 	else
	# 		session[:cart] = {}
	# 		cart = session[:cart]
	# 	end

	# 	if cart[id] then
	# 		cart[id] = cart[id] + 1
	# 	else
	# 		cart[id] = 1
	# 	end
	# 	redirect_to :action => :index
	# end
	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end
 	private
 	def cart_params
 	end
end
