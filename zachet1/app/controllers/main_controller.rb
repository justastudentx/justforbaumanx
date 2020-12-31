class MainController < ApplicationController
  def index
    if Post.all.length > 0
      @posts = Post.all.group_by{ |post| post.user_id }
      @users = User.all
    else
      @posts = []
    end
  end
end
