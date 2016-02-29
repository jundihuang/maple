class HomeController < ApplicationController
  def index
    @articles =  Article.paginate(page: params[:page],per_page: 20).order("id DESC")
    @classifications = Classification.all
  end

  def show_articles_by_classification
    @articles = Article.where(classification_id: params[:id]).paginate(page: params[:page],per_page: 20).order("id DESC")
    @classifications = Classification.all
    render 'home/index'
  end  
end
