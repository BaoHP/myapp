class SessionsController < Devise::SessionsController
  def new
    super
  end

  def destroy
    begin
      1 / 0
    rescue ZeroDivisionError => exception
      Sentry.capture_exception(exception)
    end

    Sentry.capture_message("test message")
    super
  end
end
