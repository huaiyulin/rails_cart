class CartsController < ApplicationController
	before_action :authenticate_user!, except: :index
	def add
		id = params[:id]
		if !session[:carts]
			session[:carts] = {}
		end
		carts = session[:carts]
		
		if carts[id]
			carts[id] += 1
		else
			carts[id] = 1
		end
		# not: redirect_to :index
		# render 才適用 render :index
		redirect_to :action => :index
	end

	def clearCart
		session[:carts] = nil
		# not: redirect_to :index
		# render 才適用 render :index
		redirect_to :action => :index
	end

  def index
  	if session[:carts]
  		@carts = session[:carts]
  	else
  		@carts = {}
  	end
  end
end
