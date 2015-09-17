require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    it "should return home page" do
      get '/'
      expect(response.status).to eq 200
#      response.status.should be 200
    end
    it "should have GeekHub word" do
      visit root_path
      expect(page).to have_content('GeekHub')
    end
  end
end
