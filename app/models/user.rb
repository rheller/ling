class User < ActiveRecord::Base
  has_secure_password
  has_many :cards
  has_many :histories
  has_many :words, through: :histories


  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :password_digest, presence: true


  def premium?
    self.plan == "premium"
  end

end
