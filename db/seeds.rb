require "json"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

list = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
ingredients = []
list["drinks"].each do |couple|
  word = couple["strIngredient1"].capitalize
  ingredients << word
end

ingredients.sort!

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end
