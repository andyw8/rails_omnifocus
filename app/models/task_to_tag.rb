class TaskToTag < ApplicationRecord
  self.table_name = "TaskToTag"
  belongs_to :task
  belongs_to :tag
end
