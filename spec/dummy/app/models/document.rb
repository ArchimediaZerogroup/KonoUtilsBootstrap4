# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ApplicationRecord
  belongs_to :user

  has_one_attached :doc
  has_one_attached_remover :doc

  before_destroy :almost_one


  private

  def almost_one
    if self.destroyed_by_association.nil?
      # se cancellando questo elemento non abbiamo più nemmeno uno
      if (self.user.documents.count - 1) < 1
        self.errors.add(:base, :almost_one)
        throw :abort
      end
    end
  end


end
