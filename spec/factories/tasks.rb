FactoryBot.define do
  factory :task do
    status { 0 }
    title { 'teste' }
    description { 'Testar tudo' }
    color { 'green' }
    priority { 0 }
  end
end
