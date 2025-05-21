class Perspective < ApplicationRecord
  self.table_name = "Perspective"
  has_many :attachments, dependent: :destroy
end
