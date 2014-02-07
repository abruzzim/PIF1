# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Patient.delete_all
Patient.create({
  fname: "Mario",
  lname: "Abruzzi",
  dob: "1965-10-21",
  gender: "M"
  })
puts "%SEED-I-PATIENTS, attempting to add patient row."
