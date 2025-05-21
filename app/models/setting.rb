class Setting < ApplicationRecord
  self.table_name = "Setting"
  belongs_to :odo_metadata, foreign_key: "value", primary_key: "value"
end