# coding: utf-8
require 'set'
class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "custom"

  # 每个页面几乎都会加载的数据，在这里获取。
  def get_classifications
    @classifications = Classification.all
  end

  def get_specials
    @specials = Special.all
  end

  def get_all_used_tags
    @tags = ActsAsTaggableOn::Tag.all
    #  根据@tags的长度产生对应的随机数
    @word_size_list = rand_number(@tags.size, 8, 20)
    @word_color_list = rand_color(@tags.size)
  end


  private
  def rand_number(n, min, max)
    randoms = Set.new
    loop do
      randoms << min + rand(max - min)
      return randoms.to_a if randoms.size >= n
    end
  end

  # 随机生成颜色
  def rand_color(n)
    randoms = Set.new
    loop do
      # 定死了前面8位就不会生成与背景色ffffff相近的颜色了，提高对比度
      randoms << "#"+ "00" +rand(16..255).to_s(16)+rand(16..255).to_s(16)
      return randoms.to_a if randoms.size >= n
    end
  end
end
