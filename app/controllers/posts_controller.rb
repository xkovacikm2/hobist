class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :add_attendant]
  before_action :authenticate_owner, only: [:update, :destroy]
  before_action :load_post, only: [:show, :add_attendant, :remove_attendant]
  before_action :validate_remove_attendant, only: :remove_attendant
  before_action :validate_add_attendant, only: :add_attendant

  def index
    @posts = Post.filter(post_search_params(params[:post])).paginate page: params[:page], per_page: 9
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

  def add_attendant
    @post.users << current_user
  end

  def remove_attendant
    @post.users.delete current_user
  end

  def autocomplete_user_name
    autocomplete_entity :name do |term|
      User.where('LOWER(name) like ? or LOWER(email) like ?', "%#{term.downcase}%", "%#{term.downcase}%").limit 10
    end
  end

  def autocomplete_city_name
    autocomplete_entity :name do |term|
      City.where('LOWER(name) like ?', "%#{term.downcase}%").limit 20
    end
  end
end
