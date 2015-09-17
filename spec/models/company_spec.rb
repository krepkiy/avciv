require 'rails_helper'

describe Company do
  before { @company = Company.new(name: 'To do something good') }

  subject { @company }
  # it 'should have name' do
  #   expect(@company).to respond_to(:name)
  # end
  it { should respond_to(:name) }

  it { should be_valid }

end