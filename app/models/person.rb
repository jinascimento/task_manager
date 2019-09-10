class Person < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, foreign_key: :responsible_id
  has_one :user, foreign_key: :people_id
end
