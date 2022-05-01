Rails.application.routes.draw do
  scope 'api' do
    get '/campaigns' => 'campaigns#index'
    get '/campaigns/sector/:sector_name' => 'campaigns#filter_campaigns_by_sector'
    get '/campaigns/investment_count/:investment_count' => 'campaigns#filter_campaigns_by_investment_count'
    post '/campaign/:campaign_id/investment' => 'investments#create'
  end
end
