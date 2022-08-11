class ClientsController < ApplicationController

  def new
  end

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def search
    @client = Client.where("number_auto = ?", params[:number_auto])
    if @client_params == :number_auto
      redirect_to @client[id]
    end
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
      id_client.puts "<body>#{client_params[:number_auto]} #{client_params[:brand_auto]} #{client_params[:model_auto]} #{client_params[:km]}км. Тип ЭБУ #{client_params[:swid]}: Сумма #{client_params[:price]} Телефон #{client_params[:phone]} Дата #{client_params[:data]}<br />#{client_params[:deffect]}<br />#{client_params[:repair]}<br /><body>"
      id_client.close

      redirect_to @client

        else
          render action: 'new'
    end
  end

  def edit
    @client = Client.find(params[:id]) # Для того что бы отредактировать , нужно получить Сущьность (переменная обьект)
    # И передать ей все ее свойства, только после этого сущьность можно изменить. Представление edit.html.erb
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client  #  если использовать Редирект - то  вывод представления из create  отображатьсяя не будет
      # будет делаться редирект на роутер SHOW - файл Креате можно удалить с редиректом он не используется
    else
      render action: 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:number_auto, :brand_auto, :model_auto, :km, :vin, :deffect, :repair, :swid, :phone, :price, :data)
  end

end