class Person < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, foreign_key: :responsible_id
end
