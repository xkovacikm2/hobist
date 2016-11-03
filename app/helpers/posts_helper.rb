module PostsHelper
  def authenticate_owner
    load_post
    return if performed?
    redirect_unauthorized unless current_user? @post.user_id
  end

  def load_post
    @post = Post.find id: params[:id]
    render_404 if @post.nil?
  end

  def build_post_filter
    @post_filter = Post.new post_filter_params(params[:post])
  end

  def post_filter_params(pars)
    pars ||= {}
    pars.slice :name, :time
  end
end
