class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  OFFSET = 978307200 # Integer(Time.parse("2001-01-01T00:00:00.000Z"))

  def self.offset_now
    Time.at(Integer(Time.now) - OFFSET)
  end

  def readonly?
    true
  end
end
