class HomeController < ApplicationController
  def index
    @articles = Article.all
    @classifications = Classification.all
  end

  def show_articles_by_classification
    @articles = Article.where(classification_id: params[:id]).find_each
    @classifications = Classification.all
    render 'articles/index'
  end  
end
