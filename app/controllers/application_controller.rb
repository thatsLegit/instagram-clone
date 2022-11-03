# typed: strict

class ApplicationController < ActionController::Base
  def debug(msg)
    Rails.logger.debug ActiveSupport::LogSubscriber.new.send(:color, msg, :yellow)
  end
end
