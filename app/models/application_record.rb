class ApplicationRecord < ActiveRecord::Base
  OFFSET = Integer(Time.parse("2001-01-01T00:00:00.000Z"))

  primary_abstract_class

  def readonly?
    true
  end
end
