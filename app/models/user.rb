class User < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills, :interests


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
