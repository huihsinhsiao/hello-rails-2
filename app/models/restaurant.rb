class Restaurant < ApplicationRecord
  validates :title, presence: true
  validates :mail, presence: true
end
