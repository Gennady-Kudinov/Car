class ModelsController < ApplicationController
  def create
    @brand = Brand.find(params[:brand_id])
    @brand.models.create(model_params)

    redirect_to brand_path(@brand)
  end

  private

  def model_params
    params.require(:model).permit(:name)
  end

end
