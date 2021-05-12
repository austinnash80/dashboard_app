Rails.application.routes.draw do
  resources :daily_sales do collection {post :import}
    collection do
      get 'run_update'
    end
  end
  resources :sequoia_product_lists do collection {post :import} end
  resources :id_number_storages
  resources :sequoia_members do collection {post :import}
    collection do
      get 'run_update'
      get 'run_update_2'
    end
  end
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
  get 'sequoia_matchings/no_mail_search'
  get 'sequoia_matchings/ea_no_mail_search'
  get 'sequoia_matchings/cpa_customer_matching'
  get 'sequoia_matchings/ea_customer_matching'
  get 'pages/home'
  get 'pages/master_lists'
  get 'pages/customer_matching_cpa'
  root :to => 'pages#home'              # Replace this with whatever you want your root_path to be.
                                        # This path is where unauthorized users will be redirected_to.
  get '/login' => 'sessions#new'         # This will be our sign-in page.
  post '/login' => 'sessions#create'     # This will be the path to which the sign-in form is posted
  delete '/login' => 'sessions#destroy'  # This will be the path users use to log-out.
end
