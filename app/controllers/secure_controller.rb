class SecureController < ApplicationController
  def controller_error
    raise StandardError, "Intentional controller failure for demonstration"
  end

  def db_error
    ActiveRecord::Base.connection.execute("SELECT secret_column FROM items")
    render plain: "This should not be reached"
  end
end