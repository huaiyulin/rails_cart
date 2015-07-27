class ProductsController < ApplicationController
	# 記得寫 before_action
	before_action :set_product, only: [:show, :edit, :update, :destroy] 

	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def edit
	end
 
	# create 的寫法和 new 的寫法要分清楚
	def create
		@product = Product.new(product_params)
		# 儲存成功或失敗的寫法
		if @product.save
			redirect_to @product, notice: 'Product was successfully created.'
		else
			# not: render 'new'
			render :new
		end
	end

	def update
		# not: @product = Product.update
		if @product.update(product_params)
			redirect_to @product, notice: 'Product was successfully updated.'
		else
			render :edit
		end
	end
	
	def destroy
		@product.destroy
		# not: redirect_to :index
		# both fine: redirect_to products_path or products_url
		redirect_to products_url, notice: 'Product was successfully destroyed.'
	end

	private

		# 記得把全部都會做的動作提出來(set_product)
		def set_product
			# not: @product = Products.find(param[:id])		
			@product = Product.find(params[:id])
		end

		def product_params
			# not: @product.require(:id).permit(:title, :description, :img_url, :price, :category, :subcategory)
			params.require(:product).permit(:title, :description, :img_url, :price, :category, :subcategory)

		end

end
