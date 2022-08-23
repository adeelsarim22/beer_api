Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :beers, only: %i[index show create] do
        get :random, on: :collection
      end
    end
  end
end
