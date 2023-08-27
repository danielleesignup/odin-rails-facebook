class Notification < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  def self.create_friend_request_notification(user_id, sender_id)
    create(
      user_id: user_id,
      sender_id: sender_id,
      content: 'You have received a friend request.',
      read: false
    ).save!
  end

  def friend_request?
    content.include?("friend request") # Modify this based on your notification content
  end
end
