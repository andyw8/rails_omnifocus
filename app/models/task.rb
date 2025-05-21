class Task < ApplicationRecord
  self.table_name = "Task"
  has_many :odo_metadata, foreign_key: "value", primary_key: "valueData", class_name: "ODOMetadata", dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :contexts, through: :attachments
  has_many :folders, through: :attachments
  has_many :perspectives, through: :attachments
  has_many :children, class_name: "Task", foreign_key: "parent"
  belongs_to :parent, class_name: "Task"
  has_many :alarms, dependent: :destroy
  has_many :tags, through: :task_to_tags
  belongs_to :containing_project_info, class_name: "ProjectInfo"
  has_many :task_to_tags, dependent: :destroy
  belongs_to :project_info, class_name: "ProjectInfo"

  scope(:no_project) { where(containingProjectInfo: nil) }
end
