class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(strong_params)
        if @blogger.valid?
            @blogger.save
            redirect_to @blogger
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    private

    def strong_params
        params.require(:blogger).permit(:name, :age, :bio)
    end

end
