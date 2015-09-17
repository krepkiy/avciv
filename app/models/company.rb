class Company < ActiveRecord::Base
  has_many :users

  accepts_nested_attributes_for :users

  validates :name, presence: true, uniqueness: true
#  validates :name, :url, presence: true
  validates :url, presence: true

end
