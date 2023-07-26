# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
customer_1 = Customer.create!(first_name: "Katie", last_name: "Lonsdale", email: "email@gmail.com", address: "123 Anywhere Rd Philadelphia PA 23421")
customer_2 = Customer.create!(first_name: "Max", last_name: "Mitrani", email: "emailaddress@gmail.com", address: "346 Something St New York NY 09533")

Subscription.create!(customer_id: customer_1.id, title: "basic", price: "$5.99", status: 0, frequency: "monthly")
Subscription.create!(customer_id: customer_1.id, title: "premium", price: "$9.99", status: 1, frequency: "weekly")
Subscription.create!(customer_id: customer_1.id, title: "basic", price: "$5.99", status: 1, frequency: "bi-monthly")

Subscription.create!(customer_id: customer_2.id, title: "basic", price: "$5.99", status: 0, frequency: "monthly")
Subscription.create!(customer_id: customer_2.id, title: "premium", price: "$9.99", status: 1, frequency: "weekly")
Subscription.create!(customer_id: customer_2.id, title: "basic", price: "$5.99", status: 1, frequency: "bi-monthly")

