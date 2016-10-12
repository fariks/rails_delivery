Rails.application.routes.draw do
  resources :loads do
    resources :orders do
      delete 'unassign' => 'orders#unassign'
      post 'assign' => 'orders#assign'
    end
    get 'edit_orders' => 'loads#edit_orders'
    get 'download' => 'loads#download'
  end
  resources :addresses
  resources :drivers
  resources :vehicles

  post 'upload_orders' => 'loads#upload_orders'

  #get '/load/:id/orders/assign' => 'orders#assign'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
