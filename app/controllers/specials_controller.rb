require 'will_paginate/array'
class SpecialsController < ApplicationController

  def show
    @special = Special.find(params[:id])
    @articles =  @special.articles.to_a.paginate(page: params[:page],per_page: 20)
    render 'home/index'
  end

end
