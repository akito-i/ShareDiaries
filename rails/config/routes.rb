Rails.application.routes.draw do
  resources :diaries, only: :index
end
