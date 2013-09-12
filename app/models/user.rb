class User < ActiveRecord::Base
  belongs_to :user_group, inverse_of: :users
  has_many :spends, inverse_of: :user
  has_many :purchases, inverse_of: :user
  has_many :price_lines, inverse_of: :user
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :rememberable

end
