# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  username              :string
#  surname               :string
#  email                 :string
#  bio                   :text
#  category_id           :integer
#  birthdate             :date
#  registration_datetime :datetime
#  birttime              :time
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class User < ApplicationRecord

  validates :email, :presence => true

  belongs_to :category

  has_many :user_tags, :dependent => :destroy
  has_many :tags, :through => :user_tags


  has_many :contacts
  accepts_nested_attributes_for :contacts,reject_if: :all_blank

end
