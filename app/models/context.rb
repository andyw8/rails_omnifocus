class Context < ApplicationRecord
  self.table_name = "Context"
  has_many :attachments, dependent: :destroy
  has_many :tasks, through: :attachments
  belongs_to :parent, class_name: "Context"
end
