Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :pages
  end

  resources :pages, only: [:show] do
    get "/:id" => "posts#show", :as => :post
  end
end
