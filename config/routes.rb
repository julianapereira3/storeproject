Rails.application.routes.draw do
	resources :departments
	get "product/search/path", to: "products#search" , as: :product_search
	get "departments/path"
	get "products/path"
	root to: "products#index"
	resources :products, only: [:new, :create, :edit, :destroy, :update]
	get "departments/path"
	root to: "departments#index"
	end