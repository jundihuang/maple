class ArticlesController < ApplicationController
  def new

  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @classifications = Classification.all
  end


  private
  def article_params
    params.require(:article).permit(:title, :subtitle, :classification_id, :body)
  end
end
