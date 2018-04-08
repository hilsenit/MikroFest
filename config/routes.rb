Rails.application.routes.draw do

  devise_for :publishers, path: 'forlag', controllers: { registrations: 'publishers/registrations', passwords: 'publishers/passwords' }

  devise_for :users, path: 'brugere', controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }

  resources :users
  get '/brugere/:user_id' => 'users#another_user', as: :another_user

  # News
  resources :news

  # Books an publishers
  resources :publishers do
		resources :titles
	end

  # Cart and checkout
  resources :cart_items
  get '/checkout' => 'cart_items#checkout'
  get '/add_cart_title/:title_id/:add' => 'cart_items#change_title_count', as: :cart_change_title_count

  # Favorites
  delete 'delete_favorite/:id' => 'favorites#destroy', as: :delete_favorite
  post 'add_favorite/:title_id' => 'favorites#create', as: :save_favorite

  # MailChimp
  post 'tilfoej-bruger-til-mailliste' => 'mailchimp#add_mail_to_list', as: :add_to_mailchimp

	# Stripe
	resources :charges
  resources :credit_cards
  mount StripeEvent::Engine, at: '/payments'
	get 'tak-for-dit-koeb' => 'charges#thanks', as: :thanks

	# Pages (sider)
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
