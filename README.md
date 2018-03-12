# README

Frontend code is here: https://github.com/jdfolino/robot-factory-ui 

Design Notes
* Used a has_many for the statuses. Makes querying easier based on status. Other option was to serialize an array of statuses which would simplify the datamodel but make querying more complex
* Personally I prefer restful routes as opposed to routes like '/robots/recycle'. However these routes were part of the specification
* Retrieving 1000s of records using direct DB queiries is very slow (even with eager loading). A much faster solution is to use elasticsearch
* db:seed is used to setup the robots (would not use in production)
* CORS config is open to anyone to use. In production I would make this more restrictive 
* No eTags used. If this were in production with high traffic it would be a serious consideration
* Application is stateless so it can work in a load balanced environment without sticky sessions :)
* For production I would extract the enviroment config to environment variables
* Shroyuken is my prefered provider for activejob (unless you need delayed jobs over 15 minutes)


Setup
* Install postgres
* create role robot with createdb login password 'password1';
* bundle exec rake db:drop db:create db:migrate db:seed
* Run with bundle exec rails s -p 3001 (3001 is the port the frontend is expecting)