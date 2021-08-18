Rails.application.routes.draw do
  resources :empire_master_pa_lists do collection {post :import} end
  resources :empire_master_tx_lists do collection {post :import} end
  resources :empire_master_nj_lists do collection {post :import} end
  resources :empire_master_nc_lists do collection {post :import} end
  resources :empire_states do collection {post :import} end
  resources :auto_renew_lists do collection {post :import} end
  resources :empire_master_nm_lists do collection {post :import} end
  resources :courses_pacifics do collection {post :import} end
  resources :courses_pes do collection {post :import} end
  resources :courses_sequoia do collection {post :import}
    collection do
      get 'in_progress'
    end
  end
  resources :sequoia_ncoas do collection {post :import} end
  resources :sequoia_states do collection {post :import} end
  resources :daily_sales_empires do collection {post :import}
    collection do
      get 'run_update'
      get 'monthly'
    end
  end
  resources :mktg_postcards do collection {post :import}
    collection do
      get 'day'
    end
   end
  resources :no_mail_not_founds do collection {post :import} end
  resources :canned_responses do collection {post :import} end
  resources :mktg_materials do collection {post :import} end
  resources :empire_master_ca_lists do collection {post :import} end
  resources :empire_master_double_accounts do collection {post :import} end
  resources :empire_master_no_matches do collection {post :import} end
  resources :empire_master_matches do collection {post :import}
    collection do
      get 'matching'
    end
  end
  resources :empire_members do collection {post :import}
    collection do
      get 'run_update'
      get 'run_update_2'
    end
  end
  resources :empire_master_ny_lists do collection {post :import} end
  resources :empire_customers do collection {post :import}
    collection do
      get 'run_update'
    end
  end
  resources :mktg_exports do collection {post :import}
    collection do
      get 'print'
    end
  end
  resources :sequoia_member_exps do collection {post :import}
    collection do
      get 'run_update'
    end
  end
  resources :daily_sales do collection {post :import}
    collection do
      get 'run_update'
      get 'monthly'
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
      get 'ncoa_download'
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
  get 'empire_matchings/no_mail'
  get 'empire_matchings/lic_match'
  get 'sequoia_matchings/no_mail_search'
  get 'sequoia_matchings/ea_no_mail_search'
  get 'sequoia_matchings/cpa_customer_matching'
  get 'sequoia_matchings/ea_customer_matching'
  get 'sequoia_matchings/info'
  get 'pages/admin_page'
  get 'pages/home'
  get 'pages/customer_service'
  get 'pages/marketing'
  get 'pages/admin'
  get 'pages/master_lists'
  get 'pages/customer_matching_cpa'

  root :to => 'pages#home'              # Replace this with whatever you want your root_path to be.
                                        # This path is where unauthorized users will be redirected_to.
  get '/login' => 'sessions#new'         # This will be our sign-in page.
  post '/login' => 'sessions#create'     # This will be the path to which the sign-in form is posted
  delete '/login' => 'sessions#destroy'  # This will be the path users use to log-out.
end
