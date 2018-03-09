class ArticlesController < ApplicationController
  skip_before_action :authorize_user, only: %i[index show]
  layout 'admin', except: %i[index show]
  before_action :load_categories, only: %i[edit new]

  def index
    @articles = Article.where(draft: false)
  end

  def show
    @article = Article.includes([:categories]).find_by(id: params[:id])
    @categories = @article.categories

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
    puts params.as_json.to_s
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to dashboard_path }
        format.js { redirect_to dashboard_path, status: :created, notice: 'Saved Successfully'}
      else
        render 'edit'
      end
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

  def drafts
    @articles = Article.where(draft: true)
    render layout: 'admin'
    # respond_to do |format|
    #   format.js
    # end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :draft, category_ids: [])
  end

  def load_categories
    @categories = Category.all
  end

end
