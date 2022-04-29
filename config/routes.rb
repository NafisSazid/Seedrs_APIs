Rails.application.routes.draw do
  scope 'api' do
    get '/campaigns' => 'campaigns#index'
    post '/campaign/:campaign_id/investment' => 'investments#create'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
