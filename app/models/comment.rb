class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  # 加上面這兩個方法後讓你可以反查回去
end
