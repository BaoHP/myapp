class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :handle_exception
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  def index
    render "home/index"
  end

  private

  def handle_exception(exception)
    Sentry.capture_exception(exception)
  end
end
