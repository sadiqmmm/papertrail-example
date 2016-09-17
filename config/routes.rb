Rails.application.routes.draw do

	resources :documents do
		
		collection do 
      get :deleted # <= this
    end

	  resources :versions, only: [:destroy] do
	    member do
	      get :diff, to: 'versions#diff'
	      patch :rollback, to: 'versions#rollback'
	    end
	  end
	end

	resources :versions, only: [] do
    member do
      patch :bringback  # <= and that
    end
  end

  devise_for :users

  root to: "documents#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
