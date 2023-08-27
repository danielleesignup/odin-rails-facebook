class MainController < ApplicationController
  def homepage
    @user = current_user
    @posts = @user.posts_and_friends_posts.order(created_at: :desc)
  end
end
