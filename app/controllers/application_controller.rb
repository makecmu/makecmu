class ApplicationController < ActionController::Base
  check_authorization
  
  protect_from_forgery
end
