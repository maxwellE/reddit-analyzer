class HomeController < ApplicationController
  def index
    @search = Post.search(params[:search])
    @posts = @search.order("presence_score desc")
  end
end
