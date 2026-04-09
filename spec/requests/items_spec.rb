require "rails_helper"

RSpec.describe "Items", type: :request do
  it "returns 404 for missing secure item route" do
    get "/items/9999"
    expect(response).to have_http_status(404)
  end
end