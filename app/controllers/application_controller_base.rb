class ApplicationControllerBase < ActionController::Base 
  protect_from_forgery with: :exception 
end
