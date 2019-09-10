FactoryBot.define do
  factory :user do
    email { 'teste@teste.com.br' }
    password { 123456 }
    password_confirmation { 123456 }
    person
  end
end
