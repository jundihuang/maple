# coding: utf-8
require 'redcarpet'
class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @article_content = markdown.render(@article.body).html_safe
  end

  def show_articles_by_tag
    @tag = ActsAsTaggableOn::Tag.find_by(slug:params[:slug])
    puts @tag
    @articles = Article.tagged_with(@tag.name).paginate(page: params[:page],per_page: 20).order("id DESC")
    render 'home/index'
  end

  private
  def markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end
end
