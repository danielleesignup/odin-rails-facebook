class PostsController < ApplicationController
    def new
      @post = Post.new
    end
  
    def create
        @post = current_user.posts.build(post_params) # Build the post associated with the current user
        puts "########      @post = Post.new(post_params) --- EXECUTED      "
      if @post.save
        redirect_to @post, notice: 'Post created successfully!'
        puts "#######         redirect_to @post, notice: 'Post created successfully!' --- EXECUTED        "
      else
        puts "####### FAILED ##########"
        puts "#{@post.errors.full_messages}"
        flash[:alert] = "Save failed"
        redirect_to new_post_path
      end
    end
  
    def show
      @post = Post.find(params[:id])
    end

    def like
      puts "posts#like"
      @post = Post.find(params[:id])
      puts "      @post = Post.find(params[:id])      "
      @post.increment!(:likes_count)
      puts "      @post.increment!(:likes_count)      "
      render json: { likes_count: @post.likes_count }
      puts "      render json: { likes_count: @post.likes_count }      "
    end

    def unlike
      puts "posts#unlike"
      @post = Post.find(params[:id])
      puts "      @post = Post.find(params[:id])      "
      @post.decrement!(:likes_count)
      puts "      @post.decrement!(:likes_count)      "
      render json: { likes_count: @post.likes_count }
      puts "      render json: { likes_count: @post.likes_count }      "
    end

    
    private

    def post_params
        params.require(:post).permit(:title, :text, :post_photo)
    end
end
  