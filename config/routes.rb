Rails.application.routes.draw do

	resources :documents do
	  resources :versions, only: [:destroy] do
	    member do
	      get :diff, to: 'versions#diff'
	      patch :rollback, to: 'versions#rollback'
	    end
	  end
	end

  devise_for :users

  root to: "documents#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
