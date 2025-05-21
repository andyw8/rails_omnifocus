class ODOMetadata < ApplicationRecord
  # establish_connection "odo_database"
  self.table_name = "ODOMetadata"
  has_one :attachment, foreign_key: "value", primary_key: "previewPNGData", dependent: :destroy
  has_many :settings, foreign_key: "value", primary_key: "valueData", dependent: :destroy
end