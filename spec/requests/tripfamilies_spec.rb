require 'rails_helper'

RSpec.describe "Tripfamilies", type: :request do
  describe "GET /tripfamilies" do
    it "works! (now write some real specs)" do
      get tripfamilies_path
      expect(response).to have_http_status(200)
    end
  end
end
