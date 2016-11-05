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
    @post_filter = Post.new post_filter_model_params
  end

  #used for scoping
  def post_search_params(pars)
    pars ||= {}
    pars[:time] = DateTime.parse pars[:time] unless pars[:time].nil?
    pars.slice :name, :time, :attendants
  end

  #user for populating filter form
  def post_filter_model_params
    params.require(:post).permit(:name, :time, :attendants) unless params[:post].nil?
  end
end
