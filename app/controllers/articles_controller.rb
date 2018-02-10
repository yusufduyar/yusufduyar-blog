class ArticlesController < ApplicationController
  skip_before_action :authorize_user, only: [:index, :show]

  def index
    @articles = Article.where(draft: false)
  end

  def show
    @article = Article.find(params[:id])
    puts @article.draft
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
  end

  def edit
    @article = Article.find(params[:id])
    end

  def update
    @article = Article.find(params[:id])

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
