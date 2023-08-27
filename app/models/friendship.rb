class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: :friend_id
  
  def accept_friend_request
    update(accepted: true)
  end

  def decline_friend_request
    destroy
  end 
end
