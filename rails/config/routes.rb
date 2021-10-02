Rails.application.routes.draw do
  get  '/',    to: 'diaries#helth'
  resources :diaries, only: :index
end
