# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Usuário
puts '********************** Criando usuários **********************'
10.times do
  user = User.new(email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
  user.person = Person.new(name: Faker::Name.name)
  user.save
end

puts '********************** Usuários criados! **********************'
# Tasks
#
puts '********************** Criando Tarefas **********************'
titles = ['Futebol', 'Dentista', 'Médico', 'Almoço em família', 'Cinema', 'Jantar', 'Almoço', 'Pagar boletos', 'Lazer', 'Esportes']
10.times do |i|
  start_date = DateTime.now + rand(5)
  task = Task.new(title: titles.sample, description: Faker::Lorem.sentence,
                  start: start_date, end: start_date + rand(15),
                  priority: Task.priorities.keys.sample, responsible: Person.all.sample
  )

  Tasks::TaskCreator.new(task.attributes).call
end

10.times do |i|
  start_date = DateTime.now - rand(5)
  task = Task.new(title: titles.sample, description: Faker::Lorem.sentence,
                  start: start_date, end: start_date + rand(15),
                  priority: Task.priorities.keys.sample, responsible: Person.all.sample
  )

  Tasks::TaskCreator.new(task.attributes).call
end

puts '********************** Tarefas criadas! **********************'




