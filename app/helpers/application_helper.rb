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

  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank? or object.errors.count == 0
  end
end
