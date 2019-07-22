class User < ApplicationRecord

  validates :email, :presence => true

  belongs_to :category

  has_many :contacts
  accepts_nested_attributes_for :contacts

end
