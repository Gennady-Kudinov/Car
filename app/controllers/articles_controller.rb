class ArticlesController < ApplicationController
  def new
  end

  def show
    @article = Article.find(params[:id])
  end

    def create
      @article = Article.new(article_params)
        if @article.valid?
         @article.save
         redirect_to @article  #  если использовать Редирект - то  вывод представления из create  отображатьсяя не будет
         # будет делаться редирект на роутер SHOW - файл Креате можно удалить с редиректом он не используется
      else
        render action: 'new'
      end
    end

  # все что ниже Приватного метода не имеет доступа из вне.
  # Далее идет разрешение доступа к запретным атрибутам емайл и контакт
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
