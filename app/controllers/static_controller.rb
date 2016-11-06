class StaticController < ApplicationController
  def home
    @posts = Post.order(time: :desc).limit 3
  end
end
