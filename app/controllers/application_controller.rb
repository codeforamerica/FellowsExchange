class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def client
    LinkedIn.configure do |config|
      config.token = ENV['LINKEDIN_KEY']
      config.secret = ENV['LINKEDIN_SECRET']
      config.default_profile_fields = ['id','first-name','last-name','headline','location',
        'industry','distance','relation-to-viewer','current-share','connections','num-connections',
        'num-connections-capped','summary','specialties','proposal-comments','associations','honors',
        'interests','positions','publications','patents','languages','skills','certifications',
        'educations','three-current-positions','three-past-positions','num-recommenders',
        'recommendations-received','phone-numbers','im-accounts','twitter-accounts','date-of-birth',
        'main-address','member-url-resources','picture-url','site-standard-profile-request',
        'api-public-profile-request','site-public-profile-request','api-standard-profile-request',
        'public-profile-url']
    end
    @client ||= LinkedIn::Client.new
  end

end
