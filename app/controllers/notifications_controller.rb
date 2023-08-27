class NotificationsController < ApplicationController
    def index
        if current_user.notifications.any?
            @notifications = current_user.notifications.order(created_at: :desc) 
        else
            @notifications = []
        end
    end

    def mark_as_read
        notification = Notification.find(params[:id])
        notification.update(read: true)
        redirect_to notification_path
    end

    def accept_friend_request
        notification = Notification.find(params[:id])
        user_id = notification.user_id
        sender_id = notification.sender_id
        # Find and update Friendship record
        friendship = Friendship.find_by(user_id: user_id, friend_id: sender_id)
        friendship.accept_friend_request
        # Update the notification as well if needed
        notification.update(read: true)
        redirect_to notifications_path, notice: 'Friend request accepted.'
    end
    
    def decline_friend_request
        def decline_friend_request
            notification = Notification.find(params[:id])
            user_id = notification.user_id
            sender_id = notification.sender_id
        
            # Find and decline Friendship record
            friendship = Friendship.find_by(user_id: user_id, friend_id: sender_id)
            friendship.decline_friend_request
        
            # Update the notification as well if needed
            notification.update(read: true)
        
            redirect_to notifications_path, notice: 'Friend request declined.'
          end
    end
end
