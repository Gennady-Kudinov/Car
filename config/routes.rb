Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index

  get '/' => 'home#index'
  get '/contacts' => 'static_pages#show'
  get 'home/index'

  # resource это такой метод который делает маршрут по Path (патерну) Рест (REST) и в Патерне Рест так определено
  # что НЬЮ получает GET  Крейт получает POST
  resource :contacts, only: [:new, :create] # Resource определенный метод который принимает символ :Contacts
  # а дальше идет хешь,  ONLY это ключ хеша, а значение этого Хеша Массив С символами :new, :create методов
  # которые хотим использовать :new, :create
  resources :clients, only: [:new, :create]

end
