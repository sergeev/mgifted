Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # вывод всех ссылок
  # bundle exec rake routes
  # вход пользователя
  get 'persons/profile', as: 'user_root'

  # главная страница
  get 'welcome/index'
  # ученик
  resources :apprentices

  root 'welcome#index'

  # Создаем results для глобального поиска в базе данных в #index results
  get 'results', to: 'results#index', as: 'results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
