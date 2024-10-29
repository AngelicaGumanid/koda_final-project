class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { client: 'client', admin: 'admin' }

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :phone, presence: true, phone: { possible: true, country: 'PH' }
  validates :coins, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total_deposit, numericality: { greater_than_or_equal_to: 0 }
  validates :children_members, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
