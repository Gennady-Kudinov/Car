class ArticlesController < ApplicationController
  def new
  end

  def show
    @article = Article.find(params[:id])
  end

    def create # Атрибуты емайл и контакт запарещенные, необходимо их разрешить
      @article = Article.new(article_params)
        if @article.valid?
         @article.save
         redirect_to @article
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
