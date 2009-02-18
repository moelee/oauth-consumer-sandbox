class Post < ActiveRecord::Base
  validates_presence_of :id, :title
  validates_length_of :title, :minimum => 5
  belongs_to :blog
  has_many :comments
end
