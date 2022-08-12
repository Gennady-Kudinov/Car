class BrandsController < ApplicationController

  def new
  end

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to @brand #  если использовать Редирект - то  вывод представления из create  отображатьсяя не будет
      # будет делаться редирект на роутер SHOW - файл Креате можно удалить с редиректом он не используется
    else
      render action: 'new'
    end
  end

  def edit
    @brand = Brand.find(params[:id]) # Для того что бы отредактировать , нужно получить Сущьность (переменная обьект)
    # И передать ей все ее свойства, только после этого сущьность можно изменить. Представление edit.html.erb
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to @brand  #  если использовать Редирект - то  вывод представления из create  отображатьсяя не будет
      # будет делаться редирект на роутер SHOW - файл Креате можно удалить с редиректом он не используется
    else
      render action: 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

end


