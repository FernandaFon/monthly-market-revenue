class ProductsController < ApplicationController
    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(name: params[:name], price: params[:price], quantity: params[:quantity])
        if @product.save
            redirect_to "/products/#{@product.id}"
        else
            render :new, status: :unprocessable_entity
        end
    end
end

