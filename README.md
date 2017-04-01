# api_with_sepc_rails
== README

== INSTRUCTION

Things you need to know for this application :

* ruby version 2.2.5
  rvm use ruby-2.2.5

* rails version 4.2.4

* install postgress

* bundle install (to install required gem)

* rails s ( to start server)
* run specs use command
  rspec spec
  * run controllers specs use command
    rspec spec/controllers
* api end points
   * POST /api/v1/process_csvs/process_csv  (pass valid csv)
     * Request Type POST
     * Request Valid csv must contain first_name header and it should be csv file
     
     Response if csv file is valid
       {"saurav":4,"gaurav":2}
     Response if csv file is not valid
       {"error":{"code":1,"type":"error","message":"please provide vaild file"}}
       
     You cant upload any other file except CSV
     
   
 * File we have 
    - controller
      - api
        - v1
          - process_csvs_controller.rb (we dont have any business logic in controller all the logic is moved to service layer)
              for api i have return process csv layer
     - services
       - api
         - v1
           process_csv.rb
             this contain all the business logic
 
 * we can test api using 
    Api::V1::ProcessCsv.new(params).read_csv
    
 * we have test cases for upload csv 
   i have added two test case one positive and negative
   
