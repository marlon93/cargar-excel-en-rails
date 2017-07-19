Rails.application.routes.draw do
  resources :personas#, :except => [:new]
  
  post 'import_from_excel' => "personas#import_from_excel"
  get 'vista_subir_excel', to: 'personas#vista_subir_excel'
  #get '/personas/new' => 'personas#new', :as => 'new_persona'
  
  root 'personas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
