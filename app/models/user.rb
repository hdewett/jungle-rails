class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true, length: { minimum: 8 }


  # step 4

  def self.authenticate_with_credentials(email,password)
    @user = User.find_by_email(email.downcase.strip)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end

end
