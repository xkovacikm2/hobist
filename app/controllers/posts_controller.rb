class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_owner, only: [:update, :destroy]
  before_action :load_post, only: :show

  def index
    @posts = Post.filter(post_search_params(params[:post])).paginate(page: params[:page])
  end

  def new

  end

  def create

  end

  def update

  end

  def destroy

  end

  def show

  end

  def autocomplete_user_name
    autocomplete_entity :name do |term|
      User.where('LOWER(name) like ?', "%#{term.downcase}%").limit 10
    end
  end
end
