class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :add_attendant]
  before_action :load_post, only: [:show, :add_attendant, :remove_attendant, :edit, :update]
  before_action :authenticate_owner, only: [:update, :destroy, :edit]
  before_action :validate_remove_attendant, only: :remove_attendant
  before_action :validate_add_attendant, only: :add_attendant

  def index
    if params[:search].nil?
      @posts = Post.filter(post_search_params(params[:post])).paginate page: params[:page], per_page: 9
    else
      @posts = Post.event_name(params[:search]).paginate page: params[:page], per_page: 9
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      flash.now[:success] = 'Event successfuly created'
      render 'show'
    else
      flash.now[:danger] = 'Creating event failed, please correct mistakes'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash.now[:success] = 'Event successfuly created'
      render 'show'
    else
      flash.now[:danger] = 'Creating event failed, please correct mistakes'
      render 'edit'
    end
  end

  def destroy
    if @post.delete
      flash[:success] = 'Event deleted'
      redirect_to root_path
    else
      flash.now[:danger] = 'Something went wrong, please try again'
      render 'show'
    end
  end

  def show
  end

  def add_attendant
    @post.users << current_user
    flash[:success] = 'You are now attending the event'
    redirect_to @post
  end

  def remove_attendant
    @post.users.delete current_user
    flash[:success] = 'You are not attending the event any more'
    redirect_to @post
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
  
  private
  def post_params
    params.require(:post).permit :name, :time_at, :description, :limit, :city_id, :locality, :category_id
  end
end
