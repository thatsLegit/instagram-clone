# typed: strict

module ApplicationHelper
  def alert_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def debug(msg)
    Rails.logger.debug ActiveSupport::LogSubscriber.new.send(:color, msg, :yellow)
  end
end
