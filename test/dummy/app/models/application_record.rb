class ApplicationRecord < ActiveRecord::Base
  include SafeDeleted::ActsAsSafeDeleted

  self.abstract_class = true
end
