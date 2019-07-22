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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
