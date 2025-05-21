
# Model: ProjectInfo
class ProjectInfo < ApplicationRecord
  self.table_name = "ProjectInfo"
  has_many :tasks, dependent: :destroy, foreign_key: "projectinfo"
  belongs_to :team
  has_many :folders, through: :tasks
  has_many :next_tasks, class_name: "Task", foreign_key: "nextTask"
end
