class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  field :email, :type => String
  field :name, :type => String
  field :link, :type => String
  field :image_url, :type => String

  has_many :projects

  def self.new_with_session(params, session)
    puts "new with session"
    super.tap do |user|
      puts "tap"
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["info"]
        puts data
        user.email = data[:email]
        user.name = data[:name]
        user.link = data[:urls][:Facebook]
        user.image_url = data[:image]
      end
    end
  end  

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    # FIXME: this is insecure. a user could take control
    #        of an account by creating a facebook account
    #        with the same email address
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, 
                   :name => data.name,
                   :link => data.urls[:Facebook],
                   :image_url => data.image,
                   :password => Devise.friendly_token[0,20]) 
    end
  end

end
