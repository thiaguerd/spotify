class Token < ApplicationRecord
  has_one :user, dependent: :destroy
end
