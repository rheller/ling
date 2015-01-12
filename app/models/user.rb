class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :plays
  has_many :histories
  has_many :words, through: :histories
  belongs_to :from_language, class_name: "Language"
  belongs_to :to_language, class_name: "Language"

  validates :email, presence: true, uniqueness: true

  def premium?
    self.plan == "premium"
  end

end
