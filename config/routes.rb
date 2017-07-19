Rails.application.routes.draw do
  resources :personas
  
  post 'import_from_excel' => "personas#import_from_excel"
  
  root 'personas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
