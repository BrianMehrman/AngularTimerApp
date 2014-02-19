# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!( :name => 'Admin', :email => 'admin@test.com', :password => 'password', :password_confirmation => 'password')

task_list = TaskList.create({name:'test list',owner_id:user.id})

starting_tasks = Task.create([
              {name: 'Math Test: Calculus', description: 'cal test next week need to start reading that book.', due_date: 1.week.from_now, is_public: true, creator_id: user.id ,list_id:task_list.id},
              {name: 'DO somehting', description: 'blah blah blah.', due_date: 2.week.from_now, is_public: true, creator_id: user.id ,list_id:task_list.id},
              {name: 'Rent Due', description: 'the rent must be paid!', due_date: 1.day.ago, is_public: true, creator_id: user.id },
              {name: 'Spring Break', description: 'just around the corner, need to make sure I have everything i need for this party.', due_date: Date.strptime("{ #{Date.current.month >= 5 ? Date.current.year : Date.current.year + 1}, 3, 21 }", "{ %Y, %m, %d }"), is_public: true, creator_id: user.id }
                ])

