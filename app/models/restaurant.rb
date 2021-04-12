class Restaurant < ApplicationRecord
  validates :title, presence: true

  def destroy
    update(deleted_at: Time.now)
  end

end
