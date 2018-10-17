class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum:15}
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9.!#\z%&'*+\/=?\A_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }
  validates :password, length: {minimum:8, maximum:32}, format: { with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/}


  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
