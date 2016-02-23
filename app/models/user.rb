class User < ActiveRecord::Base
  has_secure_password

  has_many :snippets, dependent: :nullify

  validates :password, length: { minimum: 7 }, allow_nil: true

  validates_presence_of(:first_name, :last_name)
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

end
