
# Model: ProjectInfo
class ProjectInfo < ApplicationRecord
  self.table_name = "ProjectInfo"
  has_many :tasks, dependent: :destroy, foreign_key: "projectinfo"
  belongs_to :team
  belongs_to :task, foreign_key: :task
  has_many :folders, through: :tasks
  has_many :next_tasks, class_name: "Task", foreign_key: "nextTask"

  scope :active, -> { where(status: :active) }
  scope :inactive, -> { where(status: :inactive) }

  def name
    task.name
  end
end
