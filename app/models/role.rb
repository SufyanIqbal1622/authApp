class Role < ApplicationRecord
  has_many :permissions
  has_many :users

  ATTRIBUTES_PARAMS = [:name]
end
