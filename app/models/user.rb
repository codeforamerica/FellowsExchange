class User < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills, :interests


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.skill_list = user.add_linked_in_info(auth)
    end
  end

  def add_linked_in_info(auth)
    client = linked_in_client
    rtoken = auth['credentials']['token']
    rsecret = auth['credentials']['secret']

    client.authorize_from_access(rtoken, rsecret)

    @skill = client.profile.skills
    skill = []
    user_skills = nil
    unless @skill.nil?
      @skill.all.each do |linked_in_skill|
        skill.push(linked_in_skill.skill.name)
        user_skills = skill.join(',')
      end
    end

    user_skills

  end

  protected

  def linked_in_client
    LinkedIn.configure do |config|
      config.token = ENV['LINKEDIN_KEY']
      config.secret = ENV['LINKEDIN_SECRET']
      config.default_profile_fields = ['certifications','educations',
        'phone-numbers','positions','picture-url','skills','summary']
    end
    linked_in = LinkedIn::Client.new
    linked_in_client ||= linked_in
  end

end
