class BrandsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new(brand_params)
      @brand.save
    if @brand.save
      render action: 'new'
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

end


