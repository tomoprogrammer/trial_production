class Money < ApplicationRecord
  belongs_to :user
  validates :payment, presence: true
  
  validates :memo, presence: true,length: {in: 2..20}
end
