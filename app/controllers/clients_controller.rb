class ClientsController < ApplicationController
  def new
  end

  def create
    @client = Client.new(client_params)
    @client.save
  end

  private

  def client_params
    params.require(:client).permit(:number_auto, :brand_auto, :model_auto, :km, :vin, :deffect, :swid, :phone, :price, :data)
  end

end