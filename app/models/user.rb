class User < ActiveRecord::Base
  has_secure_password

  belongs_to :company

  validates :name, :email, presence: true
end
