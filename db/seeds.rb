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
  email: "mmm@mail.ru",
  role: 2,
  rank: 1,
  password: "mmmmmmm",
  password_confirmation: "mmmmmmm",
)

User.create(
  username: "Nick",
  email: "nnn@mail.ru",
  role: 0,
  rank: 1,
  password: "nnnnnnn",
  password_confirmation: "nnnnnnn",
)

User.create(
  username: "Bob",
  email: "bbb@mail.ru",
  role: 0,
  rank: 1,
  password: "bbbbbbb",
  password_confirmation: "bbbbbbb",
)

User.create(
  username: "Vik",
  email: "vvv@mail.ru",
  role: 0,
  rank: 1,
  password: "vvvvvvv",
  password_confirmation: "vvvvvvv",
)