class Folder < ApplicationRecord
  self.table_name = "Folder"
  has_many :attachments, dependent: :destroy
  has_many :children, class_name: "Folder", foreign_key: "parent"
  belongs_to :parent, class_name: "Folder"
  has_many :tasks, dependent: :destroy
end