# typed: strict

class ApplicationController < ActionController::Base
  def debug(msg)
    logger.debug '@@@@@@@@@@@@@DEBUG_OUTPOUT@@@@@@@@@@@@@@@@@@'
    logger.debug msg
    logger.debug '@@@@@@@@@@@@@@@@@@@DEBUG_OUTPOUT@@@@@@@@@@@@@@@@@@@@@@@@@'
  end
end
