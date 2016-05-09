# coding: utf-8
require 'set'
class ApplicationController < ActionController::Base
  before_filter :get_classifications, :get_specials, :get_all_used_tags
  before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "custom"

  # 每个页面几乎都会加载的数据，在这里获取。
  def get_classifications
    @clsifications = Classification.all
  end

  def get_specials
    @spcials = Special.all
  end

  def get_all_used_tags
    @tags = ActsAsTaggableOn::Tag.all
    #  根据@tags的长度产生对应的随机数
    @word_color_list = rand_color(@tags.size)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
  def rand_number(n, min, max)
    randoms = Array.new
    n.times do
       randoms << rand(min..max)
    end
    randoms
  end

  # 随机生成颜色
  def rand_color(n)
    randoms = Array.new
    n.times do
      # 定死了前面8位就不会生成与背景色ffffff相近的颜色了，提高对比度
      randoms << "#"+ "00" +rand(16..255).to_s(16)+rand(16..255).to_s(16)
    end
    randoms
  end
end
