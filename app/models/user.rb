class User < ActiveRecord::Base
  has_many :entries
  has_many :comments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :role
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  before_save :default_values
  def default_values
    self.role ||= "editor"
  end

  def admin?
    role == "admin"
  end

  def editor?
    role == "editor"
  end

  def search_entries(query)
    self.entries.where("japanische_umschrift LIKE ? OR kanji LIKE ? OR namenskuerzel = ? OR kennzahl = ? OR romaji_order LIKE ?", "%#{query}%", "%#{query}%", "#{query}", "#{query}", "%#{query}%")
  end

end
