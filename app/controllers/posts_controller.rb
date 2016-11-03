class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_owner, only: [:update, :destroy]
  before_action :load_post, only: :show

  def index

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
end
