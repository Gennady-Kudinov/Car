Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/' => 'home#index' # Метод вызывает открытия главную страницу без папок
  get '/contact' => 'static_pages#contact'  # Метод открывает контакты и адрес автосервиса из папки static_pages
  get 'home/index'
  get 'clients' => 'clients#new' # Методо возвращает форму заполнения после ее ввода

  # resource это такой метод который делает маршрут по Path (патерну) Рест (REST) и в Патерне Рест так определено
  # что НЬЮ получает GET  Крейт получает POST
  get 'contacts' => 'contacts#new' # Можно заменить на resource :contacts, only: [:new, :create], path_names: { :new => '' }
  resource :contacts, only: [:new, :create]
  resources :contacts
  # а дальше идет хешь,  ONLY это ключ хеша, а значение этого Хеша Массив С символами :new, :create методов
  # которые хотим использовать :new, :create
  resources :clients, only: [:new, :create]
  resources :clients

end
