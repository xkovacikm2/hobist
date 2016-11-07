module PostsHelper
  def authenticate_owner
    load_post
    return if performed?
    redirect_unauthorized unless current_user? @post.user_id
  end

  def load_post
    @post = Post.find_by id: params[:id]
    render_404 if @post.nil?
  end

  def build_post_filter
    @post_filter = Post.new post_filter_model_params
  end

  #used for scoping
  def post_search_params(pars)
    pars ||= {}
    pars[:time_to] = pars[:time_to].to_datetime.to_i.to_s unless pars[:time_to].nil? or pars[:time_to].empty?
    pars[:time_from] = pars[:time_from].to_datetime.to_i.to_s unless pars[:time_from].nil? or pars[:time_from].empty?
    pars[:attendants] = nil if pars[:attendants]&.first&.empty?
    pars[:attendants] = pars[:attendants][0].split(',').reject(&:empty?) unless pars[:attendants].nil?
    pars.slice :name, :time_from, :time_to, :attendants, :category_id, :city_name, :event_name
  end

  #user for populating filter form
  def post_filter_model_params
    params.require(:post).permit(:name, :time_from, :time_to, :category_id, :city_name,
                                 :event_name, :attendants => []) unless params[:post].nil?
  end
end
