class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { in: 1..255 }

  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end

  def self.admin_guest
    find_or_create_by!(name: '管理者ゲスト', email: 'admin_guest@example.com', admin: true) do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end
end