class Company < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users

  validates :name, :url, presence: true, uniqueness: true
  validate_on_create :validate_count

  private

  def validate_count
    if Company.find(self.company_id).users

    end
  end

end
