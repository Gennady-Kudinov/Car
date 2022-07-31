class ClientsController < ApplicationController
  def new
  end

  def create
    render plain: params[:client].inspect
  end

end