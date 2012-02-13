class ApplicationController < ActionController::Base
  check_authorization :unless => :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = exception.message

  	if user_signed_in?
  		redirect_to root_url
  	else
  		session[:login_return_path] = request.path
	    redirect_to new_user_session_path
	end
  end

	# def after_sign_in_path_for(resource)
	#     session[:login_return_path] || root_url
	# end

  protect_from_forgery
end
