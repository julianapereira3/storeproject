Rails.application.routes.draw do
	resources :departments
	get "products/path", to: "products#index", as: :products_path
	resources :products
	get "departments/path"
	root to: "products#index"
end