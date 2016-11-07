module ApplicationHelper
  def redirect_unauthorized
    flash[:danger] = 'Unauthorized access - permission denied'
    redirect_to root_path
  end

  #verifies if logged in user is user provided in argument
  #arguments accepted are: User class instance or user id
  def current_user? (user)
    if current_user
      return (current_user.id == user.id) if user.class == User
      return (current_user.id == user) if user.class == Fixnum
    end
    false
  end

  def autocomplete_entity(method, additional_data=[], &block)
    term = params[:term]
    if term && !term.empty?
      items = yield term
    else
      items = {}
    end
    render :json => json_for_autocomplete(items, method, additional_data)
  end

  def ajax_redirect_to(url)
    {js: "window.location.replace('#{url}');"}
  end

  def ajax_flash(div_id)
    render partial: 'flash/ajax_flash', locals: {div_id: div_id}
  end
end
