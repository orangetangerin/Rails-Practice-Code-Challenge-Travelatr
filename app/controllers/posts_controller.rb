class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(strong_params)
        if @post.valid?
            @post.save
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post = Post.find(params[:id])
        @post.update(strong_params)
        redirect_to @post
    end

    private

    def strong_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

end
