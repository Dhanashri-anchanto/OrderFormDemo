# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])



s = Customer.find_by_email('dhanashri@gmail.com')
if s.present?
     puts "Alredy exist"
else
    Customer.create( first_name: "Dhanashri" ,  last_name: "Joshi", mobile: "1234567890" , email: "dhanashri@gmail.com" )
    c = Customer.first
     c.addresses.build(  street_no: "11" ,  street_name: "Baner Road", area_name: "Harisadan" , city: "pune", postal_code: "123456", state: "Maharashtra", country: "India" )
end