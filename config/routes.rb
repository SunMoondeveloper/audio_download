Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'home#index'
	get 'index'  => 'home#index'
	get 'data'  => 'home#data'
	post 'ajaxdownload'  => 'home#ajaxdownload'
	get 'ajaxdownload'  => 'home#ajaxdownload'
	get 'download'  => 'home#download'
	post 'index'  => 'home#index'
	
end
