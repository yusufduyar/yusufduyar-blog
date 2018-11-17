class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render layout: 'admin'
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
    @result = [description: @category.description, makaleler: @articles]
  end

end
