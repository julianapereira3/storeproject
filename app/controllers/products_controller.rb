class ProductsController < ApplicationController	
	before_action :set_product

	include Pagy::Backend

	def index
		if params[:name].present?
			@products = Product.where "name like ?", "%#{@name = params[:name]}%"
		end
			@product_with_discount = Product.order(:price).limit 2
			@pagy, @products = pagy(Product.all, items: 3)
	end

	def new
		@product = Product.new
		@departments = Department.all
	end

	def edit
		rendering :edit
	end

	def update
		if @product.update(product_params)
			flash[:notice] = "Produto atualizado com sucesso!"
			redirect_to root_url
		else
			rendering :edit
		end
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "Produto criado com sucesso!"
			redirect_to root_url
		else
			rendering :new
		end
	end

	def destroy
		@product.destroy
		flash[:notice] = "Produto removido com sucesso!"
		redirect_to root_url
	end

	private

	def product_params
		params.require(:product).permit(:name, :desc, :price, :amount, :id_department)
	end

	def set_product
		@product = Product.find_by(params[:id])   
	end

	def rendering(view)
		@departments = Department.all
		render view
	end

end