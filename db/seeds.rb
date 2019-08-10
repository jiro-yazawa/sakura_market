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

CashOnDelivery.create([
  {fee: 300,  orders_total_price_begin: 0,       orders_total_price_end: 9_999},
  {fee: 400,  orders_total_price_begin: 10_000,  orders_total_price_end: 29_999},
  {fee: 600,  orders_total_price_begin: 30_000,  orders_total_price_end: 99_999},
  {fee: 1000, orders_total_price_begin: 100_000, orders_total_price_end: 2_147_483_647},
])
