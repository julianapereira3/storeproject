Rails.application.routes.draw do
		resources :departments
		get "products/path"
		get "product/search/path", to: "products#search" , as: :product_search
		resources :products
		get "departments/path"
	root to: "products#index"
end