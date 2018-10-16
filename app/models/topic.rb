class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true, file_size: {maximum: 3.megabytes.to_i}

  belongs_to :user

  mount_uploader :image, ImageUploader
  has_many :favorites
end
