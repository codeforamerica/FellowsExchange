Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linked_in, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
end
