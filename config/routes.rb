Rails.application.routes.draw do
  scope 'api' do
    get '/campaigns' => 'campaigns#index'
    get '/campaigns/sector/:sector_name' => 'campaigns#filter_campaigns_by_sector'
    post '/campaign/:campaign_id/investment' => 'investments#create'
  end
end
