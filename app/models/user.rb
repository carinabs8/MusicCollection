class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, authentication_keys: [:login]

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  validate :validate_username

  validates :role, :fullname, presence: true
  validates :role, inclusion: {in: ProfileEnum.values}

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end

  def email_required?
    false
  end

  def admin?
    role.to_sym == ProfileEnum::ADMIN
  end
end
