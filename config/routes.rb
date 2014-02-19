TimerApp::Application.routes.draw do


  resources :tasks
  resources :task_lists
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  namespace :api, defaults: {format: :json} do
    resources :task_lists do
      resources :tasks
    end
  end
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get '/home/try_it' => 'home#index'
  get '/home/:path.html' => 'home#page', :constraints => { :path => /.+/  }
  get '/dashboard' => 'templates#index'
  get '/landing' => "templates#index"
  get '/task_lists/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }

end
