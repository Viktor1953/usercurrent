# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(
  username: "Mich",
  email: "mmm@ail.ru",
  role: 2,
  rank: 1,
  password: "michmmm",
  password_confirmation: "michmmm",
  admin: true
)

User.create(
  username: "Nick",
  email: "nnn@ail.ru",
  role: 0,
  rank: 1,
  password: "nicknnn",
  password_confirmation: "nicknnn",
  admin: false
)

User.create(
  username: "Bob",
  email: "bbb@ail.ru",
  role: 0,
  rank: 1,
  password: "bobbbbb",
  password_confirmation: "bobbbbb",
  admin: false
)

User.create(
  username: "Vik",
  email: "vvv@ail.ru",
  role: 0,
  rank: 1,
  password: "vikvvvv",
  password_confirmation: "vikvvvv",
  admin: false
)

Room.create(name:'Example')