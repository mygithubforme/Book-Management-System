# ruby-getting-started

#Edited Readme.md file

#a) What is your external data source used to populate your Heroku data sources?


I have chosen IRIS database, which i have in comma seperated value (.csv) file format.

Datalink Source: https://code.google.com/p/dataminingproject/source/browse/DataMiningApp/datasets/Iris/iris.csv?r=44


The database have 6 columns.


1) id


2) sepal_length


3) sepal_width


4) petal_length


5) petal_width


6) species


Original database have 150 records, but i have cut it down to 100 as per requirement.


See dataset file named iris.csv and select sepal_length for non-primary key query.


#b) What are the Heroku toolbelt commands to execute the scripts?


    I have used following commands to execute scripts:
  
    1) git init
  
    2) git add .
  
    3) git commit -m
  
    4) git push heroku master
  

    NOTE: I have already populated the databases. You can direclty run following commands to run scripts. 


    Now execeute following commands as mentioned below to run the scripts.  
  
  
  Postgresql Database :
  
  1) For primary key:
  
  
    heroku run ruby dbprime.rb


  2) For non-primary key:
  
  
    heroku run ruby dbnonkey.rb
  
  
  
  MongoDb Database:
  
  1) For primary key:
  
  
    heroku run ruby mongoprime.rb


  2) For non-primary key:
  
  
    heroku run ruby mongononkey.rb
  
  
  Redis Database:
  
  
  1) For primary key:
  
  
    heroku run ruby radisprime.rb


  2) For non-primary key:
  
  
    heroku run ruby radisnonprime.rb



#c) Which aspect of the implementation did you ind easy, if any, and why?


  Postgresql was easy since i am familiar with the database and it was compatible with the ruby that i installed on ruby.

#d) What aspect of the implementation did you find hard, if any, and why?


  Postgresql was easy since it was compatible with my ruby version, but Redis and Mongodb were not compatible. So, i had to
  install ruby on ubuntu and do everthing againg.


