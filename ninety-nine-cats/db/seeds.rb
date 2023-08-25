# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do
    Cat.destroy_all

    Cat.connection.reset_pk_sequence!(:cats)

    c1 = Cat.create!(birth_date: "1-1-2020", name: 'paulo', sex: 'M', color: 'green')
    c2 = Cat.create!(birth_date: "1-2-2020", name: 'mike', sex: 'M', color: 'red')
    c3 = Cat.create!(birth_date: "1-3-2020", name: 'abbey', sex: 'F', color: 'blue')
    c4 = Cat.create!(birth_date: "1-4-2020", name: 'ray', sex: 'M', color: 'red')
    c5 = Cat.create!(birth_date: "1-5-2020", name: 'shannon', sex: 'F', color: 'green')
end