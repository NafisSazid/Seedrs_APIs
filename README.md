# Instructions

1. Ruby Version - `3.1.1` and Rails Version - `7.0.2.4` is used

2. Clone the repository, open this directory, and run `bundle install`

3. Run `bundle exec rake db:migrate` to migrate the database

4. Run `bundle exec rake db:seed` to seed the database

5. Now run the application with `rails s` 

6. Retrieve Campaigns API - `GET http://localhost:3000/api/campaigns`

7. Filter Campaigns by Sector API - `GET http://localhost:3000/api/campaigns/sector/:sector_name`. Sector name E.G - HealthCare, Energy.

8. Make Investment in a Campaign API - `POST http://localhost:3000/api/campaign/:campaign_id/investment`
 
   `Request Body - `
   `{ amount: 3610.00 }`

9. Run test suites with `bundle exec rspec`
