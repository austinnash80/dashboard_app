Rails.application.routes.draw do
  resources :sequoia_customers do collection {post :import}
    collection do
      get 'run_update'
    end
  end
  resources :master_ea_double_accounts do collection {post :import} end
  resources :master_cpa_double_accounts do collection {post :import} end
  resources :master_eas do collection {post :import} end
  resources :master_cpas do collection {post :import} end
  resources :master_ea_no_mails do collection {post :import} end
  resources :master_ea_no_matches do collection {post :import} end
  resources :master_ea_matches do collection {post :import} end
  resources :master_cpa_no_mails do collection {post :import} end
  resources :master_cpa_no_matches do collection {post :import} end
  resources :master_cpa_matches do collection {post :import} end
  resources :sessions, :only => [:create, :destroy]
  resources :users
  get 'pages/home'
  get 'pages/master_lists'
  root :to => 'pages#home'              # Replace this with whatever you want your root_path to be.
                                        # This path is where unauthorized users will be redirected_to.
  get '/login' => 'sessions#new'         # This will be our sign-in page.
  post '/login' => 'sessions#create'     # This will be the path to which the sign-in form is posted
  delete '/login' => 'sessions#destroy'  # This will be the path users use to log-out.
end
