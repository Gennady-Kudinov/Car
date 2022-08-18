class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def index
    #  Поиск клиента только по номеру авто с чистой таблицы
    # @clients = Client.where(number_auto: params[:search])

    #  Поиск клиента и таблицы всех клиентов
     @clients = Client.where(["number_auto LIKE ?", "%#{params[:search]}%"])
  end

  def show
    @client = Client.find(params[:id])
  end

  def search
  end

  def create

    #  @obj1 = Model1.new model1_params @obj1.save @obj2 = Model2.new model2_params @obj2.save  #Проверить

    @client = Client.new(client_params)
    @params = params[:problem_user_attributes]
    if @client.valid?
      @client.save
      response = FileUtils.mkdir_p "BAZA/#{client_params[:brand_auto]}/#{client_params[:model_auto]}/#{client_params[:number_auto]}"

      database_file = File.new('BAZA/database.txt', 'a+')
      database_file.puts "#{client_params[:number_auto]}  #{client_params[:brand_auto]}  #{client_params[:model_auto]}  #{client_params[:km]}км.  Сумма #{client_params[:price]} Телефон #{client_params[:phone]} Дата #{client_params[:data]}"
      database_file.close

      id_client = File.new("BAZA/#{client_params[:brand_auto]}/#{client_params[:model_auto]}/#{client_params[:number_auto]}/#{client_params[:number_auto]}.html", 'a+')
      id_client.puts "<body>#{client_params[:number_auto]} #{client_params[:brand_auto]} #{client_params[:model_auto]} #{client_params[:km]}км. Тип ЭБУ #{client_params[:swid]}: Сумма #{client_params[:price]} Телефон #{client_params[:phone]} Дата #{client_params[:data]}<br />#{client_params[:problem_user]}<br />#{client_params[:repair_user]}<br /><body>"
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
    params.require(:client).permit(:number_auto, :brand_auto, :model_auto, :km, :vin, :problem_user, :repair_user, :swid, :phone, :price, :data, problem_user_attributes: [:each, :problem_user, :attribute])
  end

end