class User < ApplicationRecord

  # gives our User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, length: {minimum: 5}

  def authenticate_with_credentials(params[:email], params[:password])
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      user
    end
  end
end
