class User < ActiveRecord::Base
  has_secure_password

  belongs_to :company

  validates :name, :email, presence: true
  validates_uniqueness_of :email, scope: :company

  private

#  def company_is_present
#    if User.find_by(self.id).owner == 'true'
#      errors.add( "bla bla bla")
#    end

end
