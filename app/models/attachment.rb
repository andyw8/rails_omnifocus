class Attachment < ApplicationRecord
  self.table_name = "Attachment"
  belongs_to :odo_metadata, foreign_key: "previewPNGData", primary_key: "value"
  belongs_to :context
  belongs_to :folder
  belongs_to :perspective
  belongs_to :task
end
