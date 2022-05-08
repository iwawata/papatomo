class Post < ApplicationRecord
   has_one_attached :image
   belongs_to :end_user
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

   def get_image
    if image.attached?
      image
    end
   end

   def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
   end

end
