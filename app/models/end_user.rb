class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :nick_name, presence: true

  has_one_attached :profile_image

  def self.guest
    find_or_create_by!(nick_name: 'ゲストユーザー' ,email: 'guestuser@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.nick_name = "ゲストユーザー"
    end
  end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/man2.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
