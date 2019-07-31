Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    scope :library do
      get :all, to: 'library#all'
      get :movies, to: 'library#movies'
      get :seasons, to: 'library#seasons'
    end

    resources :users, only: [:show], param: :user_id do
      member do
        resources :purchases, only: [:index, :create]
      end
    end
  end
end
