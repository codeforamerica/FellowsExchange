class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :authenticate_user

  private

  def authenticate_user
    if session['user_id']
    else
      redirect_to failure_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def client
    LinkedIn.configure do |config|
      config.token = ENV['LINKEDIN_KEY']
      config.secret = ENV['LINKEDIN_SECRET']
      config.default_profile_fields = ['id','first-name','last-name','headline','location',
        'summary','specialties','interests','positions','languages','skills','site-standard-profile-request',
        'educations','three-current-positions','three-past-positions','picture-url']
    end
    @client ||= LinkedIn::Client.new
  end

end
