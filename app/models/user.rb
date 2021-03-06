class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :moneys, dependent: :destroy

  validates :name, length: {in: 2..20}
  validates :name, uniqueness: true

  validates :introduction, length: { maximum: 50 }
end
