class User < ActiveRecord::Base
  has_many :quotes
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :send_welcome_message
  
  validates :name, presence: true, length: { minimum: 2, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 2, maximum: 40 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6, maximum: 20 }
  validates :phone, length: { is: 10 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def send_welcome_message 
    unless self.phone == "9999999999" #can be cleaned up with stubs
      account_sid = "ACd2ddae5650ca06720b7a7ba52f6a04d4"
      auth_token = "1d2ced219c26754a5bd66f297aa45945"
      client = Twilio::REST::Client.new account_sid, auth_token
       
      from = "+17702855442" # My Twilio number
      
      client.account.messages.create(
        :from => from,
        :to => self.phone,
        :body => "Hey #{self.name}, welcome to quotely!"
      )
    end
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
