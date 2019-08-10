# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tax.create([
  {rate: 0.08, active_date_begin: '1900-01-01', active_date_end: '2019-09-30'},
  {rate: 0.10, active_date_begin: '2019-10-01', active_date_end: '9999-12-31'},
])
