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
                                        
Course.create!( name: "Andy Song", 
                email:"andy.song@rmit.edu.au", 
                password: "password", 
                password_confirmation: "password", 
                photo_url: "https://img.116s.com/2015-06/15/14343732280007.jpg")
