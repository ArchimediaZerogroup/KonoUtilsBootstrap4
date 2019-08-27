# == Schema Information
#
# Table name: contacts
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  contact_tipology_id :integer
#  val                 :string
#  principal           :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Users::Contact < Contact
end
