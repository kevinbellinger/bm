class Bookmark < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  default_scope { order('created_at DESC') }
  
end
