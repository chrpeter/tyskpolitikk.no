# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create(username:'unknown', password:'rRdt3sq4YRKCywsgrHap', password_confirmation:'rRdt3sq4YRKCywsgrHap')
u.create_profile(name:'Ukjent', email:"dd@dd.no")
