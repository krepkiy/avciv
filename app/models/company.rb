class Company < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users

  validates :name, :url, presence: true, uniqueness: true
#  validate :my_custom_validation_method
#  before_save :my_custom_validation_method
#  validate_on_create :validate_count
#  after_save :validate_count


  private

#  def my_custom_validation_method
#    if User.where(email: users.where(owner: true).first.try(:email), owner: true).present?
#      if User.where(email: users.where(owner: true).first.try(:email), owner: true).present?
#    if User.where(email: 'sas@rambler.ru', owner: true).present?
#      if User.where(email: self.email, owner: true).any?
#      errors.add(:base, "Cannot create a company because there is already a company for this owner")
#    end
#  end

##  def validate_count
#    Company.find(self.id).users.where(owner: 'true').any?
#    User.exists?(:username => value)
#    if Company.exists?(self.id)
#    if Company.find(self.id).users.find_by(company_id: self.id, owner: 'true').exists?
##    if Company.find(self.id).users.find_by(owner: true)
##      errors.add( 'maximum 5 accounts are allowed per person')
##    end
##  end

end
