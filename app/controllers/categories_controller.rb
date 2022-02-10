class CategoriesController < ApplicationController
  
  rescue_from Exception do |err|
    render json: {error: err.message}, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |err|
    render json: {error: err.message}, status: :unprocessable_entity
  end


  # GET /categories
  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end

  #GET /categories/{id}
  def show
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end

  # POST /categories or /categories.json
  def create
    @category = Category.create!(category_params)
    render json: @category, status: :ok
  end

  # PUT /categories/{id}
  def update
    @category = Category.find(params[:id])
    @category.update!(category_params)
    render json: @category, status: :ok
  end

  #DELETE /categories/{id}
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end