Rails.application.routes.draw do
  resources :tweets do
    collection do
      post :confirm
    end
  end
  root to: "tweets#index"
end
