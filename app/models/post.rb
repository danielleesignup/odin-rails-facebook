class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  mount_uploader :post_photo, PostPhotoUploader
  validates :title, :text, presence: true
  

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
