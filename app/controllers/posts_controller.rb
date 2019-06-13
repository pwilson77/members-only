class PostsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]

    def index
      @posts = Post.all.paginate(page: params[:page])
    end

    def new 
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params) 
        if @post.save
          flash[:info] = "Post succesfully created"
          redirect_to root_url
        else
          render 'new'
        end
    end


    private

    def post_params
      params.require(:post).permit(:title, :message)
    end
end
