# Ruby on Rails RAD Assignment 1
This repository hosts the final submission of the course management web application for Rapid Application Development, semester 1, 2019

## Testing - IMPORTANT
Use admin@rmit.edu.au (password: "password") to test admin functions 

Use andy.song@rmit.edu.au (password: "password") to test normal user functions

## Achieved aim - MARKING
###This web application achieves all the requirements for the PASS stage (EXCEPT the Voting functions)
Home page and proper linking to other pages for guest users

Sign up, log in, log out functions for Coordinators

###This web application achieves all the requirements for the CR stage (EXCEPT the Contact Us page)
Update headers and extra functions that are only available once logged in

Create/edit/update Categories, Locations, Courses and Coordinators

###This web application achieves all the requirements for the 80+ stage (EXCEPT the Upload Avatar function)
Friendly redirection for wrong URLs (only works in local machine, won't work in the Heroku app)

Unauthorised people cannot enter the Course Editing pages

A fully functioning Admin Dashboard to manage courses and coordinators

###This web application has not attempted any of the requirements for the 90+ stage.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

$ bundle install 

$ bundle update


Next, migrate the database and seed data:

$ rails db:migrate

$ rails db:reset

$ rails db:seed

Finally, run the test suite to verify that everything is working correctly:

$ rails test


If the test suite passes, you'll be ready to run the app in a local server:

$ rails server


For more information on the assignment specifications, please see it on Canvas.
