class SpecialsController < ApplicationController
  def index
    @specials = Special.all
  end

  def new
    
  end

  def create
    @special = Special.new(special_params)
    if @special.save
      redirect_to @special
    else
      render 'new'
    end
  end

  def show
    @special = Special.find(params[:id])
  end

  def special_params
    params.require(:special).permit(:title)
  end  
end
