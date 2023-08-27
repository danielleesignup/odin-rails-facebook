class AddPostPhotoToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_photo, :string
  end
end
