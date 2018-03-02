class ArticlesController < ApplicationController
  skip_before_action :authorize_user, only: [:index, :show]

  def index
    @articles = Article.where(draft: false)
  end

  def show
    @article = Article.includes([:categories]).find_by(:id => params[:id])
    @categories = @article.categories
    puts '========== ARTICLE SHOW ============='
    puts @article.as_json
    puts @categories.as_json
    puts '====================================='

    puts logged_in?
    if !@article.draft
      @article
    elsif logged_in?
      @article
    else
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
    render layout: 'admin'
  end

  def edit
    @article = Article.find(params[:id])
    end

  def update
    puts 'params' + params.as_json.to_s
    @article = Article.find(params[:id])
    unless @article.categories.exists?(params[:category][:category_id])
      @article.article_categories.create(category: Category.find(params[:category][:category_id]))
    end

    puts 'article_params' + article_params.as_json.to_s
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def publish
    @article = Article.find(params[:id])

    if @article.update_attribute(:draft, false)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
    end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
