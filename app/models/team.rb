class Team < ApplicationRecord
  self.table_name = "Team"
  has_many :project_infos, dependent: :destroy
end
