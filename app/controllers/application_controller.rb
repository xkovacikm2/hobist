class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper
  include PostsHelper

  before_action :build_post_filter

  def render_404
    respond_to do |format|
      format.html { render :file => "/public/404.html", :status => 404 }
      format.js { render :file => "/public/404.html", :status => 404 }
    end
  end

  def redirect_back(backup_location=root_path)
    redirect_to ((request.referer) ? (request.referer) : (backup_location))
  end
end
