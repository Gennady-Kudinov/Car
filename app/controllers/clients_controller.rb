class ClientsController < ApplicationController

  def new
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
      @client.save
      response = FileUtils.mkdir_p "BAZA/#{client_params[:brand_auto]}/#{client_params[:model_auto]}/#{client_params[:number_auto]}"

      database_file = File.new('BAZA/database.txt', 'a+')
      database_file.puts "#{client_params[:number_auto]}  #{client_params[:brand_auto]}  #{client_params[:model_auto]}  #{client_params[:km]}км.  Сумма #{client_params[:price]} Телефон #{client_params[:phone]} Дата #{client_params[:data]}"
      database_file.close

      id_client = File.new("BAZA/#{client_params[:brand_auto]}/#{client_params[:model_auto]}/#{client_params[:number_auto]}/#{client_params[:number_auto]}.html", 'a+')
      id_client.puts "<body>#{client_params[:number_auto]} #{client_params[:brand_auto]} #{client_params[:model_auto]} #{client_params[:km]}км. Тип ЭБУ #{client_params[:swid]}: Сумма #{client_params[:price]} Телефон #{client_params[:phone]} Дата #{client_params[:data]}<br />#{client_params[:deffect]}<br /><body>"
      id_client.close
        else
          render action: 'new'
    end
  end

  private

  def client_params
    params.require(:client).permit(:number_auto, :brand_auto, :model_auto, :km, :vin, :deffect, :swid, :phone, :price, :data)
  end

end