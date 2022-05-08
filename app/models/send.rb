class Send < ApplicationRecord
  has_one_attached :image
   belongs_to :end_user
   
   def get_image
    if image.attached?
      image
   end
end
