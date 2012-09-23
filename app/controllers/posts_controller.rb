class PostsController < ApplicationController
  def index
    @search = Post.search(params[:search])
    @posts = @search.order("presence_score desc").page params[:page]
  end
end
