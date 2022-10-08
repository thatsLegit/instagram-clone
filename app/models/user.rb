class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # careful here, the symbol is :postS, the model is however Post...
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
