class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :content2, :user_id
  validates :name,  :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }
  validates :user_id, :presence => true

  has_many :comments
  belongs_to :user
end
