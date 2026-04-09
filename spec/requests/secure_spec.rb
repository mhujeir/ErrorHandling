require 'rails_helper'

RSpec.describe "Secures", type: :request do
  describe "GET /controller_error" do
    it "returns http success" do
      get "/secure/controller_error"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /db_error" do
    it "returns http success" do
      get "/secure/db_error"
      expect(response).to have_http_status(:success)
    end
  end

end
