class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def send_friend_request
      @user = User.find(params[:id])
      sender_id = params[:sender_id]
      puts "#SENDER_ID: #{params[:sender_id]}"
      user_id = params[:id]
      puts "#USER_ID: #{params[:id]}"
      # current_user.create_friend_request(params[:id], sender_id)
      @user.create_friend_request(user_id, sender_id)  
      Rails.logger.info(@user.errors.inspect) 
      Notification.create_friend_request_notification(user_id, sender_id)
      Rails.logger.info(@user.errors.inspect) 

      # Rails.logger.info(@notification.errors.inspect) 
      redirect_to @user, notice: 'Friend request sent!'
    end

    #this is not a recursive function. Why is there a function called inside the very function. No wonder nothing's happening.
  
    def accept_friend_request
      @user = User.find(params[:id])
      current_user.accept_friend_request(@user)
      redirect_to @user, notice: 'Friend request accepted!'
    end
  
    def decline_friend_request
      @user = User.find(params[:id])
      current_user.decline_friend_request(@user)
      redirect_to @user, notice: 'Friend request declined.'
    end
  
    def cancel_friend_request
      @user = User.find(params[:id])
      current_user.cancel_friend_request(@user)
      redirect_to @user, notice: 'Friend request canceled.'
    end
end
