Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :clients do
    resources :problem_user
  end

  get '/' => 'home#index' # Метод вызывает открытия главную страницу без папок
  get '/contact' => 'pages#contact'  # Метод открывает контакты и адрес автосервиса из папки static_pages
  get 'home/index'



  # resource это такой метод который делает маршрут по Path (патерну) Рест (REST) и в Патерне Рест так определено
  # что НЬЮ получает GET  Крейт получает POST
  get 'contacts' => 'contacts#new' # Можно заменить на resource :contacts, only: [:new, :create], path_names: { :new => '' }
  resource :contacts, only: [:create]
  resources :articles do
    resources :comments
  end
  # а дальше идет хешь,  ONLY это ключ хеша, а значение этого Хеша Массив С символами :new, :create методов
  # которые хотим использовать :new, :create
  get 'search' => 'clients#search'
  get 'clients' => 'clients#index' # Методо возвращает форму заполнения после ее ввода

  resources :clients
  resources :clients do
    resources :models
  end

  get 'articles' => 'articles#new'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

 get 'brands' => 'brands#index'
  resources :brands do
    resources :models
  end
  resources :brands

end