require 'will_paginate/array'
class ClassificationsController < ApplicationController
  def show
    @classification = Classification.find(params[:id])
    @articles =  @classification.articles.to_a.paginate(page: params[:page],per_page: 20)
    render 'home/index'
  end
end
