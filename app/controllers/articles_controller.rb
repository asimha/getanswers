class ArticlesController < ApplicationController
before_action :authenticate_user!

  def index
    @articles = Article.all.page(params[:page]).per(10)
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    binding.pry
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
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

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
