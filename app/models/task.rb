# frozen_string_literal: true

class Task < ApplicationRecord
  COLOR_BY_PRIORITY = { 0 => 'green', 1 => 'yellow', 2 => 'red' }.freeze

  validates :title, :priority, presence: true
  attr_accessor :date_range
  before_save :set_color_by_priority

  def all_day_task?
    start == start.midnight && self.end == self.end.midnight ? true : false
  end

  def set_color_by_priority
    self.color = COLOR_BY_PRIORITY[priority]
  end
end
