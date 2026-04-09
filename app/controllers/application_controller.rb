class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from StandardError, with: :render_internal_error

  private

  def render_not_found(exception)
    Rails.logger.error("RecordNotFound: #{exception.message}")
    render plain: "Item not found", status: :not_found
  end

  def render_internal_error(exception)
    return render_not_found(exception) if exception.is_a?(ActiveRecord::RecordNotFound)


    Rails.logger.error("InternalError: #{exception.class} - #{exception.message}")
    Rails.logger.error(exception.backtrace.join("\n")) if exception.backtrace
    render plain: "Something went wrong", status: :internal_server_error
  end
end