class Restaurant < ApplicationRecord
  validates :title, presence: true

  scope :available, -> { where(deleted_at: nil) }
  # scope :abc, -> { XXX }
  # scope :def, -> { YYY }

  belongs_to :user

  def destroy
    update(deleted_at: Time.now)
  end

end
