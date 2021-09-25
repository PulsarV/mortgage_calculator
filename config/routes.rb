Rails.application.routes.draw do
  root to: 'banks#index'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :banks, except: [:show], concerns: :paginatable do
    resources :calculations, concerns: :paginatable
  end
end
