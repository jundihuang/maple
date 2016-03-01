# coding: utf-8
class HomeController < ApplicationController
  before_filter :get_classifications, :get_specials
  def index
    @articles =  Article.paginate(page: params[:page],per_page: 20).order("id DESC")
  end
end
