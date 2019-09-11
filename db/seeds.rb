# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Usuário

10.times do
  user = User.new(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')
  user.person = Person.new(name: 'administrador')
  user.save
end

# Tasks
titles = ['Futebol', 'Dentista', 'Médico', 'Almoço em família', 'Cinema', 'Jantar', 'Almoço', 'Pagar boletos', 'Lazer', 'Esportes']
20.times do |i|
  task = Task.new(title: titles.sample, description: Faker::Lorem.sentence,
                  start: DateTime.now, end: DateTime.now + rand(9),
                  priority: Task.priorities.keys.sample, responsible: Person.all.sample
  )

  Tasks::TaskCreator.new(task.attributes).call
end






