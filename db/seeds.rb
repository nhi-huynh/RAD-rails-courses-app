# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coordinator.create!(name: "Andy Song", 
                    email:"andy.song@rmit.edu.au", 
                    password: "password", 
                    password_confirmation: "password", 
                    photo_url: "https://img.116s.com/2015-06/15/14343732280007.jpg")

Coordinator.create!(name: "Alex Jiang", 
                    email:"alex.jiang@rmit.edu.au", 
                    password: "password", 
                    password_confirmation: "password", 
                    photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLLyVTVwNzysJ8B52EOQcrHZbufwBovlsXIR5LUOO69yeBew7jPA")
                    
Coordinator.create!(name: "Ali Yavari", 
                    email:"ali.yavari@rmit.edu.au", 
                    password: "password", 
                    password_confirmation: "password",
                    photo_url: "http://img1.comic.zongheng.com/comic/image/2009/0/xinedemiru/ori/20090122053635557463.jpg")

Coordinator.create!(name: "Shekar Kalra", 
                    email:"shekhar.kalra@rmit.edu.au", 
                    password: "password", 
                    password_confirmation: "password")
                    
Coordinator.create!(name: "Admin Nistrator", 
                    email:"admin@rmit.edu.au", 
                    password: "password", 
                    password_confirmation: "password",
                    is_admin: true)

Course.create!( name: "Rapid Application Development", 
                prerequisite:"Web Programming", 
                description: "This is a beginner course", 
                coordinator_id: 1)
                
Course.create!( name: "Capstone Project", 
                prerequisite:"Advanced Programming", 
                description: "This course utilises your knowledge from Advanced Programming to create a commercial project", 
                coordinator_id: 3)
                
Course.create!( name: "Advanced iOS programming", 
                prerequisite:"3 years of iOS development or equivalent", 
                description: "This is a beginner course", 
                coordinator_id: 2)
                

Course.create!( name: "Object-Oriented Design Patterns", 
                prerequisite:"2 years commercial development experience", 
                description: "This is a high-level software architecture design course", 
                coordinator_id: 2)
                
Course.create!( name: "Intelligent Web", 
                prerequisite:"Artificial Intelligence", 
                description: "This course is only intended for 3rd year students", 
                coordinator_id: 1)
                
Category.create!( category: "Web Development")
Category.create!( category: "Java")
Category.create!( category: "Full Stack Dev")
Category.create!( category: "iOS Engineering")

Location.create!( location: "14.10.31")
Location.create!( location: "14.08.26")
Location.create!( location: "14.10.30")

Course.find(1).location_ids = 1, 2
Course.find(2).location_ids = 1
Course.find(3).location_ids = 3
Course.find(4).location_ids = 1, 2, 3
Course.find(5).location_ids = 1

Course.find(1).category_ids = 1
Course.find(2).category_ids = 2
Course.find(3).category_ids = 3
Course.find(4).category_ids = 4
Course.find(5).category_ids = 4


# CoursesCategories.create!(role: 'admin', user_id: 2, company_id: 1)
# CoursesCategories.create!(role: 'admin', user_id: 2, company_id: 1)
# CoursesCategories.create!(role: 'admin', user_id: 2, company_id: 1)
# CoursesCategories.create!(role: 'admin', user_id: 2, company_id: 1)
# CoursesCategories.create!(role: 'admin', user_id: 2, company_id: 1)

