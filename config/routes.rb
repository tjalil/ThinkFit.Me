Thinkfitme::Application.routes.draw do

  post "oauth/callback" => 'oauths#callback'
  get "oauth/callback" => 'oauths#callback' # for use with Github
  get "oauth/:provider" => 'oauths#oauth', :as => :auth_at_provider

  resources :friendships, only: [:index, :show, :create, :destroy]
  resources :users do
    member do
      get 'dashboard'
      get 'activity_stats'
      post 'activity_stats'
    end

    resources :comments, only: [:new, :create]

    resources :goals, only: [:new, :create, :edit, :update] do
      resources :activity_logs, only: [:new, :create, :destroy]
    end

    resources :challenges, only: [:index, :new, :create, :edit, :update, :destroy]

  end

  resources :teams do
     resources :challenges, only: [:new, :create]  
     resources :comments, only: [:new, :create]
    post 'join'
  end


  resources :user_sessions, only: [:new, :create, :destroy]

  root 'users#index', as: 'index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
