class User
  include Mongoid::Document
  include Mongoid::Timestamps


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  field :email, type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at, type: Time
  field :username, type: String
  field :role, type: Integer

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false

  def user?
    role == 0
  end

  def admin?
    role == 1
  end
end

# include Mongoid::Document
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
# devise :database_authenticatable, :registerable,
      #  :recoverable, :rememberable, :validatable

## Database authenticatable
# field :email,              type: String, default: ""
# field :encrypted_password, type: String, default: ""

## Recoverable
# field :reset_password_token,   type: String
# field :reset_password_sent_at, type: Time

## Rememberable
# field :remember_created_at, type: Time

## Trackable
# field :sign_in_count,      type: Integer, default: 0
# field :current_sign_in_at, type: Time
# field :last_sign_in_at,    type: Time
# field :current_sign_in_ip, type: String
# field :last_sign_in_ip,    type: String

## Confirmable
# field :confirmation_token,   type: String
# field :confirmed_at,         type: Time
# field :confirmation_sent_at, type: Time
# field :unconfirmed_email,    type: String # Only if using reconfirmable

## Lockable
# field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
# field :unlock_token,    type: String # Only if unlock strategy is :email or :both
# field :locked_at,       type: Time
# include Mongoid::Timestamps