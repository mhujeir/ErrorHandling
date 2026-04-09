require "rails_helper"

RSpec.describe "Leak routes", type: :request do
  it "exposes raw exception message for missing item leak" do
    get "/leaks/missing_item/9999"
    expect(response).to have_http_status(500)
    expect(response.body).to include("Couldn't find Item")
  end

  it "exposes stack trace information for controller error leak" do
    get "/leaks/controller_error"
    expect(response).to have_http_status(500)
    expect(response.body).to include("Intentional controller failure")
    expect(response.body).to include("app/controllers")
  end

  it "exposes database error details" do
    get "/leaks/db_error"
    expect(response).to have_http_status(500)
    expect(response.body).to match(/secret_column|SQLException|SQLite/i)
  end
end