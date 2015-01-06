class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :cards
  has_many :histories
  has_many :words, through: :histories

  validates :email, presence: true, uniqueness: true
  # validates :full_name, presence: true

  def premium?
    self.plan == "premium"
  end

end
