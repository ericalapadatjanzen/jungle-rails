class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { in: 6..20 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    end
  end
end


