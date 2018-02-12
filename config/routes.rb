Rails.application.routes.draw do
  devise_for :admins
	root 'pages#countdown'
	get '/forside' => 'pages#frontpage'
	get '/admin' => 'admin#index'
end
