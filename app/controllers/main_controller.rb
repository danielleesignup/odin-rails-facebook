class MainController < ApplicationController
  def homepage
    @user = current_user
    
    if @user
      
      @posts = @user.posts_and_friends_posts
      @posts = @posts.order(created_at: :desc)
    else
      flash[:alert] = "Please log in to access this page."
      redirect_to new_user_session_path
    end
    
    # @user = current_user
    # puts "##    @user = current_user    ##"
    # @posts = @user.posts_and_friends_posts.order(created_at: :desc)
    # puts "## @posts = @user.posts_and_friends_posts.order(created_at: :desc)##"
  end
end
