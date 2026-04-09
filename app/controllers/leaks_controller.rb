class LeaksController < ApplicationController
  def missing_item
    begin
      @item = Item.find(params[:id])
      render plain: "Found item: #{@item.name}"
    rescue => e
      render plain: "RAW EXCEPTION MESSAGE EXPOSED TO USER:\n#{e.message}", status: 500
    end
  end

  def controller_error
    begin
      raise StandardError, "Intentional controller failure for demonstration"
    rescue => e
      render plain: "STACK TRACE EXPOSED:\n#{e.class}: #{e.message}\n\n#{e.backtrace.first(8).join("\n")}", status: 500
    end
  end

  def db_error
    begin
      result = ActiveRecord::Base.connection.execute("SELECT secret_column FROM items")
      render plain: result.to_a.inspect
    rescue => e
      render plain: "DATABASE ERROR EXPOSED:\n#{e.class}: #{e.message}", status: 500
    end
  end
end