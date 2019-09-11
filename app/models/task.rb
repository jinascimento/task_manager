# frozen_string_literal: true

class Task < ApplicationRecord
  COLOR_BY_PRIORITY = { 0 => '#6fd86f', 1 => '#7471F9', 2 => '#FF2A2B' }.freeze

  validates :title, :priority, :responsible_id, :start, :end, presence: true
  attr_accessor :date_range
  before_save :set_color_by_priority
  belongs_to :responsible, class_name: :Person, foreign_key: :responsible_id

  def all_day_task?
    start == start.midnight && self.end == self.end.midnight ? true : false
  end

  def set_color_by_priority
    self.color = COLOR_BY_PRIORITY[priority]
  end
end
