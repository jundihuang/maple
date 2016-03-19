# coding: utf-8
require 'redcarpet'
class ArticlesController < ApplicationController

  before_filter :get_classifications, :get_specials, :get_all_used_tags
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
    # 保证html安全，才能正确传送到view
    @article_content = markdown.render(@article.body).html_safe
  end

  def show_articles_by_classification
    @articles = Article.where(classification_id: params[:id]).paginate(page: params[:page],per_page: 20).order("id DESC")
    render 'home/index'
  end

  def show_articles_by_special
    @articles = Article.where(special_id: params[:id]).paginate(page: params[:page],per_page: 20).order("id DESC")
    render 'home/index'
  end

  def show_articles_by_tag
    tag = ActsAsTaggableOn::Tag.find_by(id: params[:id])
    @articles = Article.tagged_with(tag.name).paginate(page: params[:page],per_page: 20).order("id DESC")
    render 'home/index'
  end

  private
  def article_params
    params.require(:article).permit(:title, :subtitle, :classification_id, :body)
  end

  def markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

end
