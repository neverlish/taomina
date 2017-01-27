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


	def qty
		@cart = Cart.find(params[:id])
		quantity = params[:qty]
		@cart.update(quantity: quantity)
		redirect_to :back
	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		redirect_to cart_index_path
	end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end

 	private
 	def cart_params

 	end
end
