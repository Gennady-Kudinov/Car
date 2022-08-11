Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

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
  get 'clients' => 'clients#index' # Методо возвращает форму заполнения после ее ввода
  resources :clients, only: [:new, :create, :show]
  resources :clients
  resources :clients do
    resources :models
  end

  get 'articles' => 'articles#new'
  # resource :articles, only: [:new, :create]

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  #get 'brands' => 'brands#index'
  get 'brands/new' => 'brands#new'
  get 'brands/new' => 'brands#create'
  get 'brands' => 'brands#index'
  resource :brands, only: [:new, :create]

end