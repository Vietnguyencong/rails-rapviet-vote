class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_voter
  #get voted rapper for specific user
  def get_voted_rapper
    return self.find_up_voted_items.first
  end

  devise :database_authenticatable, :validatable, :rememberable, :omniauthable, :omniauth_providers => [:facebook]
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provide: auth.provider, uid: auth.uid).first_or_create do |user|
      # puts "second time "
      # puts auth.uid
      # user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      end
  end

end

# :registerable
# :recoverable,  