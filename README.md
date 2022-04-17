# README - Seeders

Things you may want to cover:

## Ruby version
- 3.0.0
**Please check the `.ruby-version` file**

## System dependencies
Please notice the `Gemfile` to get the bird's eye level view of the required gems / libs needed to be 
- Run the `bundle install` to get all the requried gems
- You might going to need `postgresql` installed into your machine to be able to run this application.

 
## Database creation
- Default database server is: `postgresql`
- Please run `rails db:create` to create the required databases.
- Please run `rails db:migrate` to generate the database tables.
- And run `rails db:seed` to generate dataset to test with.  


## How to run the test suite
- Please run `bundle exec rspec` to run the spec suite.
## Once all are ready please run `rails server` to start the applicaiton

## Endpoints:
  1. `GET /api/campaigns` to get the campaigns list as json response
     - you can filter through the specific result set by writing
       ```.json
         {
           "q": "value"
         }

       ```
       as the body json input with the endpoint.
     - you also can get the pagination downward on the `json` body as `next` and `prev` link.
  
  2. `POST /api/investments` will create a valid investment if you pass few conditions described params over the body.
    - exmaple:

      ```.json

        {
            "data": {
                "attributes": {
                    "name": "Jhon doe",
                    "contact_email": "omega@email.com",
                    "campaign_id": 450,
                    "amount": 40
                }
            }
        }

      ```

      **conditions**
      - Amount always has to be equal or more than `investment multiple` of the corresponding campaign.
      - All `name`, `contact_email`, `amount` and `campaign_id` should be provided.
      - Amount is given in Pound and later turned into pence before saving.



