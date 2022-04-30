Rails.application.routes.draw do
  scope 'api' do
    get '/campaigns' => 'campaigns#index'
    post '/campaign/:campaign_id/investment' => 'investments#create'
  end
end
