class BlogsController < ApplicationController
    
    def index
        @blogs = Blog.all.order('created_at DESC')
    end
    
    def show
        @blog =Blog.find(params[:id])
    end
    
    def new
        @blog = Blog.new
    end
    
    def create
        @blog=Blog.new(blog_params)
        
        # If post params do not meet secifications, do render instead of redirect b/c redirect refreshes input fields
        if @blog.save
            redirect_to @blog
        else
            render 'new'
        end
    end
    
    def edit
        @blog = Blog.find(params[:id])    
    end
    
    def update
        @blog = Blog.find(params[:id])  
        if @blog.update(params[:blog].permit(:tile, :body))
            redirect_to @blog
        else
            render 'edit'
        end
    end
    
    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        
        redirect_to blogs_path    
    end
    
    
    private
    def  blog_params
        params.require(:blog).permit(:title, :body)
    end
    
end
