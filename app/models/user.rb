class User < ActiveRecord::Base
  has_one :authentication
  has_one :account
  has_one :provider, through: :account
  has_one :address

  accepts_nested_attributes_for :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  class << self
    def new_with_session(params, session)
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"], without_protection: true) do |user|
          user.attributes = params
          user.valid?
        end
      else
        super
      end
    end

    def from_omniauth(auth, current_user)
      authorization = Authentication.where(:provider => auth.provider, 
                                           :uid => auth.uid.to_s, 
                                           :token => auth.credentials.token, 
                                           :secret => auth.credentials.secret).first_or_initialize
      if authorization.user.blank?
        user = current_user.nil? ? User.where(:email => auth["info"]["email"]).first : current_user
        if user.blank?
          user = User.new do |user|
            user.password = Devise.friendly_token[0, 10]
            user.name = auth.info.name 
            user.email = auth.info.email 
            auth.provider == "facebook" ? user.save(:validate => false) : user.save
          end
       end
        authorization.username = auth.info.nickname
        authorization.user_id = user.id
        authorization.save
      end      
      authorization.user
    end
  end
end
