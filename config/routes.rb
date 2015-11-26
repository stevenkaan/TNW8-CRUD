SightGuide::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get 'cities/:id/delete_city_image' => 'cities#deleteCityImage'
  get 'cities/:id/delete_city_image_2' => 'cities#deleteCityImage2'
  get 'cities/:id/delete_city_image_3' => 'cities#deleteCityImage3'
  get 'cities/:id/delete_city_image_4' => 'cities#deleteCityImage4'

  get 'markers/:id/delete_marker_image' => 'markers#deleteMarkerImage'
  get 'markers/:id/delete_marker_image_2' => 'markers#deleteMarkerImage2'
  get 'markers/:id/delete_marker_image_3' => 'markers#deleteMarkerImage3'
  get 'markers/:id/delete_marker_image_4' => 'markers#deleteMarkerImage4'

  get 'markers/:id/delete_marker_audio_nld' => 'markers#deleteMarkerAudioNld'
  get 'markers/:id/delete_marker_audio_eng' => 'markers#deleteMarkerAudioEng'
  get 'markers/:id/delete_marker_audio_esp' => 'markers#deleteMarkerAudioEsp'



  get 'city_infos/:id/delete_city_audio' => 'city_infos#deleteCityAudio'
  get 'marker_infos/:id/delete_marker_audio' => 'marker_infos#deleteMarkerAudio'

  # resources :cities
  # resources :markers
  resources :marker_infos
  resources :city_infos

  resources :routes do 
    resources :markers
  end

  resources :countries do
    resources :cities
  end

  resources :cities do
    resources :city_infos
    resources :markers
    resources :routes
  end

  resources :markers do
    resources :marker_infos
  end


  root 'sessions#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/api/getcities' => 'api#getCities'
  get '/api/getmarkers/:id' => 'api#getMarkers'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
