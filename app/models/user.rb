class User < ActiveRecord::Base
  has_secure_password

  belongs_to :company

  validates :name, :email, presence: true
  validates_uniqueness_of :email, scope: :company
  validate :company_owner_email, on: :create

  private

  def company_owner_email
    user = User.where(email: self.email, owner: true)
    errors.add(:email, "уже зарегистрирован для другой компании") if user.present? && self.owner
  end


end
