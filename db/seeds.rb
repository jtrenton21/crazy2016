# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Visit.create(location: 'Shrine Mosque', vdate: 'May 17, 1956')
	Visit.create(location: 'Frisco Train Depot', vdate: 'Nov. 8, 1956')
	Visit.create(location: 'Hammons Student Center', vdate: 'June 17, 1977')

	Eventday.create(day:'Tuesday', month: 'April', date: '26', year: '2016')
	Eventday.create(day:'Wednesday', month: 'April', date: '27', year: '2016')
    Eventday.create(day:'Thursday', month: 'April', date: '28', year: '2016')
    Eventday.create(day:'Friday', month: 'April', date: '29', year: '2016')
    Eventday.create(day:'Saturday', month: 'April', date: '30', year: '2016')

	User.create(email:'tl@example.com' , password: 'password')