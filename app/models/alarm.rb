class Alarm < ApplicationRecord
  self.table_name = "Alarm"
  belongs_to :task
end