class Permission < ApplicationRecord
  belongs_to :role

  ATTRIBUTES_PARAMS = [:subject_class, :action, :role_id]

end
