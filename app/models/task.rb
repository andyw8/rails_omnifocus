class Task < ApplicationRecord
  self.table_name = "Task"
  has_many :odo_metadata, foreign_key: "value", primary_key: "valueData", class_name: "ODOMetadata", dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :contexts, through: :attachments
  has_many :folders, through: :attachments
  has_many :perspectives, through: :attachments
  has_many :children, class_name: "Task", foreign_key: "parent"
  # belongs_to :parent, class_name: "Task"
  has_many :alarms, dependent: :destroy
  has_many :tags, through: :task_to_tags
  belongs_to :containing_project_info, class_name: "ProjectInfo"
  has_many :task_to_tags, dependent: :destroy
  belongs_to :project_info, class_name: "ProjectInfo"

  scope :no_project, -> { where(containingProjectInfo: nil) }
  scope :in_inbox, -> { where(inInbox: true) }
  # scope :deferred, -> { where(dateToStart: nil) }
  # scope :not_deferred, -> { where.not(dateToStart: nil) }
  scope :deferred, -> { where("dateToStart > ?", Time.now) }
  scope :not_deferred, -> { where("dateToStart is null OR dateToStart < ?", Time.now) }
  scope :completed, -> { where.not(dateCompleted: nil) }
  scope :not_completed, -> { where(dateCompleted: nil) }
  scope :blocked, -> { where(blocked: true) }
  scope :not_blocked, -> { where(blocked: false) }
  scope :flagged, -> { where(flagged: true) }
  scope :not_flagged, -> { where(flagged: false) }

  def added_at
    Time.at(dateAdded + OFFSET)
  end

  def modified_at
    Time.at(dateModified + OFFSET)
  end

  def completed_at
    Time.at(dateCompleted - OFFSET)
  end

  # unsure how this differs from dateToStart
  def effective_date_to_start_at
    Time.at(effectiveDateToStart - OFFSET)
  end

  def parent_name
    return nil unless parent
    Task.find(parent).name
  end

  def self.available
    not_deferred.not_completed.not_blocked
  end
end
