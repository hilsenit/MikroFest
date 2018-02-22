Rails.application.routes.draw do

  resources :news

  devise_for :admins

  resources :publishers do
		resources :titles
	end

  # MailChimp
  post 'tilfoej-bruger-til-mailliste' => 'mailchimp#add_mail_to_list', as: :add_to_mailchimp

	# Stripe
	resources :charges
	get 'tak-for-dit-koeb' => 'charges#thanks', as: :thanks

	# Sider (pages)
	get '/forlagene' => 'pages#publishers', as: :all_publishers
	get '/forlaget/:id' => 'pages#publisher', as: :one_publisher
	get '/alle-titler' => 'pages#titles', as: :all_titles
	get '/forlaget/:publisher_id/bogen/:id' => 'pages#title', as: :one_title
	get '/forside' => 'pages#frontpage'
	get '/kontakt' => 'pages#contact', as: :contact
	get '/om-os' => 'pages#about', as: :about
	get '/admin' => 'admin#index'
	root 'pages#countdown'
end
