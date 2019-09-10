FactoryBot.define do
  factory :person do
    name { 'Jhonatan' }

    transient do
      qtt_tasks { 3 }
    end

    trait :with_tasks do
      after(:create) do |person, evaluator|
        create_list(:task, evaluator.qtt_tasks, responsible: person, start: DateTime.now, end: DateTime.now + 1)
      end
    end
  end
end
