class Money < ApplicationRecord
  belongs_to :user
  validates :payment, presence: true
  
end
