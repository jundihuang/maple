# coding: utf-8

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
end
