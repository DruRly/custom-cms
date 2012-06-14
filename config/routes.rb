Cms::Application.routes.draw do

  Mercury::Engine.routes

  root to: 'posts#index'
  resources :pages do
    member { post :mercury_update }
  end 	

  resources :posts do 
  	member { post :mercury_update }
  end 
end
