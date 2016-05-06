class User < ActiveRecord::Base
  has_many :rounds

  validates :username, { presence: true, uniqueness: true }
  validates :hashword, { presence: true }
  # validate :password_security

    def authenticate(plaintext_password)
    self.password == plaintext_password
    # self.password.to_s == BCrypt::Password.create(plaintext_password).to_s
  end

  def password
    @hashed_password_obj ||= BCrypt::Password.new(self.hashword)
  end

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    @hashed_password_obj = BCrypt::Password.create(plaintext_password)
    self.hashword = @hashed_password_obj.to_s
  end

  def password_security
    if @plaintext_password.length < 8
      self.errors.add(:password, "Your password is too short")
    end
  end

end
