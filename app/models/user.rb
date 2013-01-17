class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :account, :email, :password_digest, :password, :password_confirmation, :account_name
  validates :account_name, :presence => true, :length => {:minimum => 2, :maximum => 10}
  validates :account,  :presence => true, :uniqueness => true, :format => { :with => /[0-9a-zA-Z_]{0,30}/}
  validates :email, :presence => true, :uniqueness=>true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, :presence => true, :length => {:minimum => 8, :maximum => 16}
  has_many :posts
end
