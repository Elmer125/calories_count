class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :calories
  validates_presence_of :name, length: { minimum: 5, maximum: 40 }
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    avatar.variant(resize_to_limit: [150, 150]).processed
  end

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default_profile.png')),
      filename: 'default_profile.png',
      content_type: 'image/png'
    )
  end
end
