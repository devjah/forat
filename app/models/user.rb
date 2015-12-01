class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]



    # acts_as_voter


    def self.find_for_facebook_oauth(auth)
  	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  	    user.provider = auth.provider
  	    user.uid = auth.uid
  	    #user.email = auth.info.email if auth.info.email
  	    user.password = Devise.friendly_token[0,20]
  	    user.name = auth.info.name
  	    user.image = auth.info.image
  	    user.gender = auth.extra.raw_info.gender
  	    user.link = auth.extra.raw_info.link
  	    user.location = auth.info.location
  	    user.oauth_token = auth.credentials.token
  	    user.oauth_token_expires_at = auth.credentials.expires_at
  	    user.save!
  	  end
  	end

	def self.new_with_session(params, session)
		super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		    #user.email = data["email"] if user.email.blank?
		  end
		end
	end

  def email_required?
    false
  end



end
