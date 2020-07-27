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


  has_many :contacts, -> { where(principal: [nil, false]) }, class_name: 'Users::Contact'
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  has_one :principal_contact, -> { where(principal: true) }, :class_name => 'Users::Contact'
  accepts_nested_attributes_for :principal_contact, reject_if: :all_blank

  has_many :documents, dependent: :destroy, class_name: 'Users::Document'
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true


  scope :search, ->(args) {
    query = all

    unless args[:category_id].blank?
      query = query.where(category_id: args[:category_id])
    end

    query
  }

end
