# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :priority, :responsible_id, :start, :end, presence: true
  attr_accessor :date_range
  belongs_to :responsible, class_name: :Person, foreign_key: :responsible_id

  enum status: %w(pending started done)
  enum priority: %w(low medium high)

  def all_day_task?
    start == start.midnight && self.end == self.end.midnight ? true : false
  end

end
