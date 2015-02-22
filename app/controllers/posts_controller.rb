class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index

		@posts = Post.all.order("created_at DESC")

	end

	def show
		@comments = @post.comments.all
		@comment = @post.comments.build

	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = Post.new(params[:post])
		@post.user =  current_user.id
		respond_to do |format|
			if @post.save
				format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
				format.xml  { render :xml => @post, :status => :created, :location => @post }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
			end
		end
	end

	def edit

	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end

	end

	def destroy
		@post.destroy
		redirect_to root_path
	end


	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :description, :fix, :picture)
	end
end
