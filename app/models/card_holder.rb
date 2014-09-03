class CardHolder < ActiveRecord::Base

  validate :valid_cardholder_identity

  def valid_cardholder_identity
    if self.name.blank? && self.email.blank?
      self.errors.add :base, 'Name and email are both needed'
    end
  end

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :name, length: { maximum: 30 }
end
