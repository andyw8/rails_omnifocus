class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def readonly?
    true
  end
end
