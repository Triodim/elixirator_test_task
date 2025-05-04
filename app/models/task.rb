class Task < ApplicationRecord
  belongs_to :project
  belongs_to :parent, class_name: "Task", optional: true
  has_many :subtasks, class_name: "Task", foreign_key: :parent_id, dependent: :destroy

  enum status: { progress: 0, testing: 1, released: 2 }

  before_create :set_expiration

  scope :active, -> { where(active: true) }

  private

  def set_expiration
    self.expired_at ||= 6.months.from_now
  end
end
